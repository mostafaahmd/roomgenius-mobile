// SplashState file for managing the state of the splash screen, including loading status and navigation route.

/// this enum defines the possible routes that the splash screen can navigate to after loading is complete.
enum SplashRoute {
  onboarding,
  home,
}

/// SplashState class represents the state of the splash screen, including whether it is currently loading and which route to navigate to after loading is complete.
class SplashState {
  const SplashState({this.route});
  
  /// route is an optional property that will be set to either SplashRoute.onboarding or SplashRoute.home once the loading process is complete and the appropriate route has been determined based on whether the user has seen the onboarding screens before.
  final SplashRoute? route;

  /// copyWith method allows creating a new instance of SplashState with updated values for isLoading and route, while keeping the other values unchanged.
  SplashState copyWith({
    bool? isLoading,
    SplashRoute? route,
  }) {
    return SplashState(
      route: route ?? this.route,
    );
  }
}
