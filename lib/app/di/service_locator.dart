import 'package:get_it/get_it.dart';
import 'package:roomgenius_mobile/app/localization/locale_cubit.dart';
import 'package:roomgenius_mobile/app/theme/app_theme_cubit.dart';
import 'package:roomgenius_mobile/core/storage/local_storage_service.dart';
import 'package:roomgenius_mobile/core/storage/secure_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> resetServiceLocator() async {
  await getIt.reset();
}

Future<void> setupServiceLocator() async {
  await resetServiceLocator();

  final sharedPreferences = await SharedPreferences.getInstance();

  getIt
    ..registerSingleton<SharedPreferences>(sharedPreferences)
    ..registerLazySingleton<LocaleCubit>(
      () => LocaleCubit(getIt<SharedPreferences>()),
    )
    ..registerLazySingleton<ThemeCubit>(
      () => ThemeCubit(getIt<SharedPreferences>()),
    )
    ..registerLazySingleton<LocalStorageService>(
      () => const SharedPreferencesLocalStorageService(),
    )
    ..registerLazySingleton<SecureStorageService>(
      () => const FlutterSecureStorageService(),
    );
}
