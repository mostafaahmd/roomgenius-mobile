import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roomgenius_mobile/app/app.dart';
import 'package:roomgenius_mobile/app/config/environment.dart';
import 'package:roomgenius_mobile/app/di/service_locator.dart';

Future<void> bootstrap({
  required Environment environment,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  Environment.current = environment;

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

  runApp(const AppWidget());
}