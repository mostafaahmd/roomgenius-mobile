import 'package:get_it/get_it.dart';
import 'package:roomgenius_mobile/app/localization/locale_cubit.dart';
import 'package:roomgenius_mobile/app/theme/app_theme_cubit.dart';
import 'package:roomgenius_mobile/core/storage/local_storage_service.dart';
import 'package:roomgenius_mobile/core/storage/secure_storage_service.dart';
import 'package:roomgenius_mobile/features/create_room/data/services/room_image_storage_service.dart';
import 'package:roomgenius_mobile/features/create_room/presentation/cubit/create_room_cubit.dart';
import 'package:roomgenius_mobile/features/design_studio/domain/services/interior_prompt_composer.dart';
import 'package:roomgenius_mobile/features/design_studio/domain/services/prompt_composer.dart';
import 'package:roomgenius_mobile/features/room_plans/data/datasources/room_plans_local_data_source.dart';
import 'package:roomgenius_mobile/features/room_plans/data/repositories/room_plans_repository_impl.dart';
import 'package:roomgenius_mobile/features/room_plans/domain/repositories/room_plans_repository.dart';
import 'package:roomgenius_mobile/features/room_plans/presentation/cubit/room_plans_cubit.dart';
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
    )
    ..registerLazySingleton<RoomPlansLocalDataSource>(
      () => RoomPlansLocalDataSourceImpl(
        getIt<LocalStorageService>(),
      ),
    )
    ..registerLazySingleton<RoomPlansRepository>(
      () => RoomPlansRepositoryImpl(
        getIt<RoomPlansLocalDataSource>(),
      ),
    )
    ..registerFactory<RoomPlansCubit>(
      () => RoomPlansCubit(
        getIt<RoomPlansRepository>(),
      ),
    )
    ..registerLazySingleton<RoomImageStorageService>(
      () => const RoomImageStorageService(),
    )
    ..registerLazySingleton<PromptComposer>(
      () => const InteriorPromptComposer(),
    )
    ..registerFactory<CreateRoomCubit>(
      () => CreateRoomCubit(
        imageStorageService: getIt<RoomImageStorageService>(),
        promptComposer: getIt<PromptComposer>(),
      ),
    );
}
