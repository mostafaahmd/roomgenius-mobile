import 'package:equatable/equatable.dart';

enum SplashRoute {
  onboarding,
  home,
}

class SplashState extends Equatable {
  const SplashState({this.route});

  final SplashRoute? route;

  SplashState copyWith({
    SplashRoute? route,
  }) {
    return SplashState(route: route ?? this.route);
  }

  @override
  List<Object?> get props => [route];
}
