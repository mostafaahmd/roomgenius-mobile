import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roomgenius_mobile/app/app.dart';
import 'package:roomgenius_mobile/app/config/environment.dart';
import 'package:roomgenius_mobile/app/di/service_locator.dart';
import 'package:roomgenius_mobile/core/utils/bloc_observer.dart';
import 'package:roomgenius_mobile/core/utils/logger.dart';

Future<void> bootstrap({
  required Environment environment,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  Environment.current = environment;

  FlutterError.onError = (details) {
    AppLogger.error(
      'Unhandled Flutter error',
      details.exception,
      details.stack,
    );
  };

  Bloc.observer = MyBlocObserver();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  await setupServiceLocator();

  await runZonedGuarded(
    () async => runApp(const AppWidget()),
    (error, stackTrace) {
      AppLogger.fatal('Unhandled zone error', error, stackTrace);
    },
  );
}
