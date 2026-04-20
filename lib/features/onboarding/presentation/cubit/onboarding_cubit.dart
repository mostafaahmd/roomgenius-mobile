import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomgenius_mobile/core/storage/cache_keys.dart';
import 'package:roomgenius_mobile/core/storage/local_storage_service.dart';
import 'package:roomgenius_mobile/features/onboarding/domain/entities/onboarding_step.dart';
import 'package:roomgenius_mobile/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:roomgenius_mobile/shared/constants/app_images.dart';

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

  final LocalStorageService _localStorage;

  void updatePage(int index) {
    emit(
      state.copyWith(
        currentIndex: index,
        clearError: true,
      ),
    );
  }

  Future<void> skip() async {
    await _finishOnboarding();
  }

  Future<void> complete() async {
    await _finishOnboarding();
  }

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

  void clearError() {
    emit(state.copyWith(clearError: true));
  }
}
