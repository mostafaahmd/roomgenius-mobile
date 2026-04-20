import 'package:equatable/equatable.dart';
import 'package:roomgenius_mobile/features/onboarding/domain/entities/onboarding_step.dart';

enum OnboardingError {
  saveFailed,
}

class OnboardingState extends Equatable {
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

  OnboardingStep get currentStep => steps[currentIndex];

  bool get isLastStep => currentIndex == steps.length - 1;

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

  @override
  List<Object?> get props => [steps, currentIndex, completed, error, isSaving];
}
