// this file is used to define the onboarding steps and their associated images. It will be used to display the onboarding screens in the app.

/// OnboardingStepType enum defines the possible types of steps in the onboarding process, including visualize, styles, and shopLook.
enum OnboardingStepType {
  visualize,
  styles,
  shopLook,
}

/// OnboardingStep class represents a single step in the onboarding process, including the type of step (visualize, styles, or shopLook) and the associated image path to be displayed on the onboarding screen.
class OnboardingStep {
  const OnboardingStep({
    required this.type,
    required this.imagePath,
  });

  final OnboardingStepType type;
  final String imagePath;
}
