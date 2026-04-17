// this file defines the SplashScreen widget, which is the first screen shown when the app is launched. It displays a logo and a progress indicator while the app determines whether to navigate to the onboarding screen or the home screen based on the user's state (e.g., whether they are a new user or returning user). The screen uses animations for the logo and progress indicator, and listens to the SplashCubit to get the resolved route for navigation.
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:roomgenius_mobile/app/di/service_locator.dart';
import 'package:roomgenius_mobile/app/routing/routes.dart';
import 'package:roomgenius_mobile/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:roomgenius_mobile/features/splash/presentation/cubit/splash_state.dart';
import 'package:roomgenius_mobile/l10n/app_localizations.dart';

/// SplashScreen is the first screen shown when the app is launched, displaying a logo and progress indicator while determining navigation.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  /// _splashDuration defines how long the splash screen's progress animation should run before it can navigate to the next screen. This duration is set to 2400 milliseconds (2.4 seconds) to provide enough time for the app to determine the appropriate navigation route while keeping the user engaged with the splash screen's animations.
  static const Duration _splashDuration = Duration(milliseconds: 2400);
  /// _progressController manages the animation for the progress indicator, which fills up over the duration of the splash screen. It is initialized with the _splashDuration and starts animating immediately when the splash screen is shown.
  late final AnimationController _progressController;
  /// _progressAnimation is a linear animation that goes from 0 to 1, representing the progress of the splash screen. It is driven by the _progressController and is used to animate the width of the progress indicator on the splash screen.
  late final AnimationController _pulseController;
  /// _pulseAnimation is an animation that creates a pulsing effect on the logo displayed in the splash screen. It oscillates between a scale of 1 and 1.08, giving the logo a subtle growing and shrinking effect to make the splash screen more visually engaging while the app is loading.
  late final Animation<double> _progressAnimation;
  /// _pulseAnimation is an animation that creates a pulsing effect on the logo displayed in the splash screen. It oscillates between a scale of 1 and 1.08, giving the logo a subtle growing and shrinking effect to make the splash screen more visually engaging while the app is loading.
  late final Animation<double> _pulseAnimation;
  /// _resolvedRoute holds the navigation route that the SplashCubit resolves to after determining whether the user should go to the onboarding screen or the home screen. This variable is initially null and is set when the SplashCubit emits a state with a non-null route. The splash screen listens for changes to this variable and attempts to navigate to the resolved route once the splash animation has finished.
  SplashRoute? _resolvedRoute;
  /// _animationFinished is a boolean flag that indicates whether the splash screen's progress animation has completed. It is initially set to false and is set to true when the _progressController finishes its forward animation. This flag is used in conjunction with the _tryNavigate method to ensure that the app only attempts to navigate to the next screen after the splash animation has completed, providing a smooth transition for the user.
  bool _animationFinished = false;
  /// _navigated is a boolean flag that prevents multiple navigation attempts from occurring. It is initially set to false and is set to true once the app successfully navigates to either the onboarding screen or the home screen. This flag is checked in the _tryNavigate method to ensure that navigation only happens once, even if the SplashCubit emits multiple states with resolved routes or if the splash animation finishes multiple times due to any unforeseen circumstances.
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
      duration: const Duration(milliseconds: 1000),
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
                  SizedBox(height: 18.h),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Container(
                      margin: EdgeInsetsDirectional.only(end: 16.w),
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 7.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                      child: Text(
                        'VARIANT 1 OF 10',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
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
                            'assets/images/branding/splash_logo1.png',
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.high,
                            errorBuilder: (_, error, stackTrace) {
                              debugPrint('Splash logo load failed: $error');
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