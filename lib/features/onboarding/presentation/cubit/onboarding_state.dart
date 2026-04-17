// this file is used to define the state of the onboarding process, including the current step, the list of steps, and whether the onboarding process has been completed.
import 'package:roomgenius_mobile/features/onboarding/domain/entities/onboarding_step.dart';

/// OnboardingError enum represents the possible errors that can occur during the onboarding process, such as a failure to save the onboarding data.
enum OnboardingError {
  saveFailed,
}

/// OnboardingState class represents the state of the onboarding process, including the current step, the list of steps, and whether the onboarding process has been completed.
class OnboardingState {
  const OnboardingState({
    required this.steps,
    required this.currentIndex,
    this.completed = false,
    this.isSaving = false,
    this.error,
  });

  final List<OnboardingStep> steps;
  final int currentIndex;
  final bool completed;
  final OnboardingError? error;
  final bool isSaving;


  /// currentStep getter returns the current step in the onboarding process.
  OnboardingStep get currentStep => steps[currentIndex];

  /// isLastStep getter returns whether the current step is the last step in the onboarding process.
  bool get isLastStep => currentIndex == steps.length - 1;

  /// copyWith method allows creating a new instance of OnboardingState with updated values for steps, currentIndex, and completed, while keeping the other values unchanged.
  OnboardingState copyWith({
    List<OnboardingStep>? steps,
    int? currentIndex,
    bool? completed,
    bool? isSaving,
    OnboardingError? error,
    bool clearError = false,
  }) {
    return OnboardingState(
      steps: steps ?? this.steps,
      currentIndex: currentIndex ?? this.currentIndex,
      completed: completed ?? this.completed,
      isSaving: isSaving ?? this.isSaving,
      error: clearError ? null : (error ?? this.error),
    );
  }
}