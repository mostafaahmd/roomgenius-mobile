import 'package:go_router/go_router.dart';
import 'package:roomgenius_mobile/app/routing/routes.dart';
import 'package:roomgenius_mobile/features/home/presentation/pages/home_screen.dart';
import 'package:roomgenius_mobile/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:roomgenius_mobile/features/splash/presentation/pages/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomePage(),
    ),
  ],
);