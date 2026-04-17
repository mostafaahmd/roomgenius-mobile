// this file is responsible for managing the state of the onboarding flow, including tracking the current step and handling user interactions like skipping or completing the onboarding process.
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomgenius_mobile/core/storage/cache_keys.dart';
import 'package:roomgenius_mobile/core/storage/local_storage_service.dart';
import 'package:roomgenius_mobile/features/onboarding/domain/entities/onboarding_step.dart';
import 'package:roomgenius_mobile/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:roomgenius_mobile/shared/constants/app_images.dart';

/// OnboardingCubit manages the state of the onboarding flow, including tracking the current step and handling user interactions like skipping or completing the onboarding process.
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this._localStorage)
      : super(
          const OnboardingState(
            steps: [
              OnboardingStep(
                type: OnboardingStepType.visualize,
                imagePath: AppImages.onboarding1,
              ),
              OnboardingStep(
                type: OnboardingStepType.styles,
                imagePath: AppImages.onboarding2,
              ),
              OnboardingStep(
                type: OnboardingStepType.shopLook,
                imagePath: AppImages.onboarding3,
              ),
            ],
            currentIndex: 0,
          ),
        );

  /// LocalStorageService is used to write the onboarding_seen flag to local storage when the user completes or skips the onboarding process, so that the app can remember that the user has already seen the onboarding screens and navigate directly to the home screen on future launches.
  final LocalStorageService _localStorage;

  /// updatePage method updates the current step in the onboarding flow.
  void updatePage(int index) {
    emit(
      state.copyWith(
        currentIndex: index,
        clearError: true,
      ),
    );
  }

  /// next method moves to the next step in the onboarding flow.
  void next() {
    if (state.isLastStep) return;
    emit(
      state.copyWith(
        currentIndex: state.currentIndex + 1,
        clearError: true,
      ),
    );
  }

  /// previous method moves to the previous step in the onboarding flow.
  void previous() {
    if (state.currentIndex == 0) return;
    emit(
      state.copyWith(currentIndex: state.currentIndex - 1, clearError: true),
    );
  }

  /// skip method skips the onboarding process and navigates to the home screen.
  Future<void> skip() async {
    await _finishOnboarding();
  }

  /// complete method completes the onboarding process and navigates to the home screen.
  Future<void> complete() async {
    await _finishOnboarding();
  }

  /// _finishOnboarding method completes the onboarding process and navigates to the home screen by writing the onboarding_seen flag to local storage and emitting a new state with completed set to true.
  Future<void> _finishOnboarding() async {
    emit(
      state.copyWith(
        isSaving: true,
        clearError: true,
      ),
    );

    try {
      await _localStorage.writeBool(CacheKeys.onboardingSeen, true);

      emit(
        state.copyWith(
          isSaving: false,
          completed: true,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isSaving: false,
          error: OnboardingError.saveFailed,
        ),
      );
    }
  }

  /// clearError method clears the error state in the onboarding flow.
  Future<void> clearError() async {
    emit(state.copyWith(clearError: true));
  }
}
