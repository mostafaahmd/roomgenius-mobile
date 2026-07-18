// this file defines the appRouter using GoRouter, which manages the navigation between different screens in the app. It sets up the routes for the splash screen, onboarding screen, and home screen, and specifies the initial route to be the splash screen.
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:roomgenius_mobile/app/di/service_locator.dart';
import 'package:roomgenius_mobile/app/routing/routes.dart';
import 'package:roomgenius_mobile/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:roomgenius_mobile/features/room_plans/presentation/cubit/room_plans_cubit.dart';
import 'package:roomgenius_mobile/features/room_plans/presentation/pages/create_room_plan_screen.dart';
import 'package:roomgenius_mobile/features/room_plans/presentation/pages/room_plan_details_screen.dart';
import 'package:roomgenius_mobile/features/room_plans/presentation/pages/rooms_screen.dart';
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
      builder: (context, state) {
        return BlocProvider(
          create: (_) => getIt<RoomPlansCubit>()..loadRoomPlans(),
          child: const RoomsScreen(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.rooms,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => getIt<RoomPlansCubit>()..loadRoomPlans(),
          child: const RoomsScreen(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.createRoom,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => getIt<RoomPlansCubit>()..loadRoomPlans(),
          child: const CreateRoomPlanScreen(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.roomDetails,
      builder: (context, state) {
        final planId = state.pathParameters['id'];

        if (planId == null || planId.isEmpty) {
          return const Scaffold(
            body: Center(
              child: Text('Invalid room plan id'),
            ),
          );
        }

        return BlocProvider(
          create: (_) => getIt<RoomPlansCubit>()..loadRoomPlanById(planId),
          child: RoomPlanDetailsScreen(planId: planId),
        );
      },
    ),
  ],
);
