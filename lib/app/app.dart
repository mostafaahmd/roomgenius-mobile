import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roomgenius_mobile/app/di/service_locator.dart';
import 'package:roomgenius_mobile/app/localization/locale_cubit.dart';
import 'package:roomgenius_mobile/app/routing/app_router.dart';
import 'package:roomgenius_mobile/app/theme/app_theme_cubit.dart';
import 'package:roomgenius_mobile/l10n/app_localizations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>.value(value: getIt<ThemeCubit>()),
        BlocProvider<LocaleCubit>.value(value: getIt<LocaleCubit>()),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(390, 844),
        child: BlocListener<LocaleCubit, Locale>(
          listener: (context, locale) {
            context.read<ThemeCubit>().updateLanguage(locale.languageCode);
          },
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return BlocBuilder<LocaleCubit, Locale>(
                builder: (context, locale) {
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    title: 'RoomGenius',
                    theme: themeState.themeData,
                    locale: locale,
                    routerConfig: appRouter,
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}