// this splash cubit will check if the user has seen the onboarding screens before and emit the appropriate state to navigate to either the onboarding or home screen.
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomgenius_mobile/core/storage/cache_keys.dart';
import 'package:roomgenius_mobile/core/storage/local_storage_service.dart';
import 'package:roomgenius_mobile/features/splash/presentation/cubit/splash_state.dart';

/// SplashCubit manages the state of the splash screen, including loading status and navigation route based on whether the user has seen the onboarding screens before.
class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._localStorage) : super(const SplashState());

  /// LocalStorageService is used to read the onboarding_seen flag from local storage to determine which route to navigate to after the splash screen.
  final LocalStorageService _localStorage;

  /// resolveTarget method simulates a loading process by delaying for 2 seconds, then checks if the user has seen the onboarding screens before and emits a new state with the appropriate route to navigate to.
  Future<void> resolveTarget() async {
    final onboardingSeen =
        await _localStorage.readBool(CacheKeys.onboardingSeen) ?? false;
    await Future.delayed(const Duration(seconds: 3));
    emit(
      state.copyWith(
        route: onboardingSeen ? SplashRoute.home : SplashRoute.onboarding,
      ),
    );
  }
}
