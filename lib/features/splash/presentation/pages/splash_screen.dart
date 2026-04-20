import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:roomgenius_mobile/app/di/service_locator.dart';
import 'package:roomgenius_mobile/app/routing/routes.dart';
import 'package:roomgenius_mobile/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:roomgenius_mobile/features/splash/presentation/cubit/splash_state.dart';
import 'package:roomgenius_mobile/l10n/app_localizations.dart';
import 'package:roomgenius_mobile/shared/constants/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  static const Duration _splashDuration = Duration(milliseconds: 2400);
  static const Duration _pulseDuration = Duration(milliseconds: 1000);

  late final AnimationController _progressController;
  late final AnimationController _pulseController;
  late final Animation<double> _progressAnimation;
  late final Animation<double> _pulseAnimation;

  SplashRoute? _resolvedRoute;
  bool _animationFinished = false;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();

    _progressController = AnimationController(
      vsync: this,
      duration: _splashDuration,
    );

    _pulseController = AnimationController(
      vsync: this,
      duration: _pulseDuration,
    );

    _progressAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _progressController,
        curve: Curves.linear,
      ),
    );

    _pulseAnimation = Tween<double>(
      begin: 1,
      end: 1.08,
    ).animate(
      CurvedAnimation(
        parent: _pulseController,
        curve: Curves.easeInOut,
      ),
    );

    _pulseController.repeat(reverse: true);

    _progressController.forward().whenComplete(() {
      _animationFinished = true;
      _tryNavigate();
    });
  }

  void _tryNavigate() {
    if (_navigated || !_animationFinished || _resolvedRoute == null || !mounted) {
      return;
    }

    _navigated = true;
    _pulseController.stop();

    if (_resolvedRoute == SplashRoute.onboarding) {
      context.go(RoutePaths.onboarding);
    } else {
      context.go(RoutePaths.home);
    }
  }

  @override
  void dispose() {
    _progressController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => SplashCubit(getIt())..resolveTarget(),
      child: BlocListener<SplashCubit, SplashState>(
        listenWhen: (previous, current) => current.route != null,
        listener: (context, state) {
          _resolvedRoute = state.route;
          _tryNavigate();
        },
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFB78CFF),
                  Color(0xFF6F2CFF),
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  const Spacer(),
                  AnimatedBuilder(
                    animation: _pulseAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _pulseAnimation.value,
                        child: child,
                      );
                    },
                    child: Container(
                      width: 90.w,
                      height: 90.w,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(24.r),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.18),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.06),
                            blurRadius: 22,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.r),
                        child: Padding(
                          padding: EdgeInsets.all(2.w),
                          child: Image.asset(
                            AppImages.splashLogo,
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.high,
                            errorBuilder: (_, __, ___) {
                              return Icon(
                                Icons.auto_awesome,
                                color: Colors.white,
                                size: 38.sp,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 22.h),
                  Text(
                    'RoomGenius',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 190.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.16),
                      borderRadius: BorderRadius.circular(999.r),
                    ),
                    child: AnimatedBuilder(
                      animation: _progressAnimation,
                      builder: (context, child) {
                        return Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Container(
                            width: 190.w * _progressAnimation.value,
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(999.r),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Text(
                    l10n.poweredByAi,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.90),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 3.2,
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}