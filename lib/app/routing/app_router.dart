// this file defines the appRouter using GoRouter, which manages the navigation between different screens in the app. It sets up the routes for the splash screen, onboarding screen, and home screen, and specifies the initial route to be the splash screen.
import 'package:go_router/go_router.dart';
import 'package:roomgenius_mobile/app/routing/routes.dart';
import 'package:roomgenius_mobile/features/home/presentation/pages/home_screen.dart';
import 'package:roomgenius_mobile/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:roomgenius_mobile/features/splash/presentation/pages/splash_screen.dart';

/// appRouter is the main router for the app, using GoRouter to manage navigation between screens.
final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.splash,
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      name: RouteNames.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RoutePaths.onboarding,
      name: RouteNames.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: RoutePaths.home,
      name: RouteNames.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
