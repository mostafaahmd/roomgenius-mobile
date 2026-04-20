import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:roomgenius_mobile/app/di/service_locator.dart';
import 'package:roomgenius_mobile/app/routing/routes.dart';
import 'package:roomgenius_mobile/core/storage/local_storage_service.dart';
import 'package:roomgenius_mobile/features/onboarding/domain/entities/onboarding_step.dart';
import 'package:roomgenius_mobile/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:roomgenius_mobile/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:roomgenius_mobile/features/onboarding/presentation/widgets/onboarding_bottom_card.dart';
import 'package:roomgenius_mobile/features/onboarding/presentation/widgets/onboarding_room_preview.dart';
import 'package:roomgenius_mobile/l10n/app_localizations.dart';
import 'package:roomgenius_mobile/shared/constants/app_images.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  bool _didPrecache = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_didPrecache) return;
    _didPrecache = true;

    for (final imagePath in AppImages.onboardingAssets) {
      precacheImage(AssetImage(imagePath), context);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _goToNextPage(OnboardingCubit cubit, OnboardingState state) async {
    if (state.isLastStep) {
      await cubit.complete();
      return;
    }

    await _pageController.nextPage(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (_) => OnboardingCubit(getIt<LocalStorageService>()),
      child: BlocListener<OnboardingCubit, OnboardingState>(
        listenWhen: (previous, current) =>
            previous.completed != current.completed ||
            previous.error != current.error,
        listener: (context, state) {
          if (state.completed) {
            context.go(RoutePaths.home);
            return;
          }

          if (state.error == OnboardingError.saveFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n.onboardingSaveFailed),
              ),
            );
            context.read<OnboardingCubit>().clearError();
          }
        },
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            final cubit = context.read<OnboardingCubit>();
            final step = state.currentStep;

            return Scaffold(
              backgroundColor: const Color(0xFFF7F7FA),
              body: SafeArea(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final previewHeight = math.min(
                      math.max(constraints.maxHeight * 0.42, 260.0),
                      430.0,
                    );

                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: 12.w,
                            end: 18.w,
                            top: 10.h,
                            bottom: 8.h,
                          ),
                          child: Row(
                            children: [
                              if (state.currentIndex > 0)
                                IconButton(
                                  onPressed: state.isSaving
                                      ? null
                                      : () async {
                                          await _pageController.previousPage(
                                            duration: const Duration(milliseconds: 280),
                                            curve: Curves.easeOutCubic,
                                          );
                                        },
                                  icon: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: colorScheme.onSurface,
                                  ),
                                )
                              else
                                SizedBox(width: 48.w),
                              const Spacer(),
                              TextButton(
                                onPressed: state.isSaving ? null : cubit.skip,
                                child: Text(
                                  l10n.skip,
                                  style: TextStyle(
                                    color: colorScheme.primary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Expanded(
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: state.steps.length,
                            physics: state.isSaving
                                ? const NeverScrollableScrollPhysics()
                                : const ClampingScrollPhysics(),
                            onPageChanged: cubit.updatePage,
                            itemBuilder: (context, index) {
                              return AnimatedSwitcher(
                                duration: const Duration(milliseconds: 180),
                                child: Align(
                                  key: ValueKey(index),
                                  alignment: Alignment.topCenter,
                                  child: OnboardingRoomPreview(
                                    imagePath: state.steps[index].imagePath,
                                    height: previewHeight,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 180),
                          child: OnboardingBottomCard(
                            key: ValueKey(state.currentIndex),
                            title: _titleForStep(step.type, l10n),
                            subtitle: _subtitleForStep(step.type, l10n),
                            currentIndex: state.currentIndex,
                            totalCount: state.steps.length,
                            primaryButtonText: state.isLastStep
                                ? l10n.getStartedNow
                                : l10n.next,
                            onPrimaryPressed: () async {
                              await _goToNextPage(cubit, state);
                            },
                            isSaving: state.isSaving,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String _titleForStep(OnboardingStepType type, AppLocalizations l10n) {
    switch (type) {
      case OnboardingStepType.visualize:
        return l10n.visualizeYourSpace;
      case OnboardingStepType.styles:
        return l10n.styleInSeconds;
      case OnboardingStepType.shopLook:
        return l10n.shopTheLook;
    }
  }

  String _subtitleForStep(OnboardingStepType type, AppLocalizations l10n) {
    switch (type) {
      case OnboardingStepType.visualize:
        return l10n.visualizeYourSpaceSubtitle;
      case OnboardingStepType.styles:
        return l10n.styleInSecondsSubtitle;
      case OnboardingStepType.shopLook:
        return l10n.shopTheLookSubtitle;
    }
  }
}