// this file is the main home screen that users see after completing the onboarding process. It currently just displays a simple text widget with the localized string for "home". In the future, this screen will be expanded to include more features and functionality related to the main purpose of the app, such as browsing and managing rooms, accessing user settings, and more.
import 'package:flutter/material.dart';
import 'package:roomgenius_mobile/l10n/app_localizations.dart';

/// HomeScreen is the main home screen that users see after completing the onboarding process.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Center(
        child: Text(
          l10n.home,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}