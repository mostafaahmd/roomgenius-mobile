import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeState {
  const ThemeState({
    required this.themeData,
    required this.isDarkMode,
    required this.languageCode,
  });

  final ThemeData themeData;
  final bool isDarkMode;
  final String languageCode;

  ThemeState copyWith({
    ThemeData? themeData,
    bool? isDarkMode,
    String? languageCode,
  }) {
    return ThemeState(
      themeData: themeData ?? this.themeData,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      languageCode: languageCode ?? this.languageCode,
    );
  }
}

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this._prefs)
      : super(
          ThemeState(
            themeData: _buildTheme(
              isDarkMode: false,
              languageCode: 'en',
            ),
            isDarkMode: false,
            languageCode: 'en',
          ),
        ) {
    loadTheme();
  }

  final SharedPreferences _prefs;

  static const String _themeKey = 'is_dark_mode';
  static const String _localeKey = 'app_locale';

  Future<void> loadTheme() async {
    final isDarkMode = _prefs.getBool(_themeKey) ?? false;
    final languageCode = _prefs.getString(_localeKey) ?? 'en';

    emit(
      ThemeState(
        themeData: _buildTheme(
          isDarkMode: isDarkMode,
          languageCode: languageCode,
        ),
        isDarkMode: isDarkMode,
        languageCode: languageCode,
      ),
    );
  }

  Future<void> toggleTheme() async {
    final newValue = !state.isDarkMode;
    await _prefs.setBool(_themeKey, newValue);

    emit(
      state.copyWith(
        isDarkMode: newValue,
        themeData: _buildTheme(
          isDarkMode: newValue,
          languageCode: state.languageCode,
        ),
      ),
    );
  }

  void updateLanguage(String languageCode) {
    emit(
      state.copyWith(
        languageCode: languageCode,
        themeData: _buildTheme(
          isDarkMode: state.isDarkMode,
          languageCode: languageCode,
        ),
      ),
    );
  }

  static ThemeData _buildTheme({
    required bool isDarkMode,
    required String languageCode,
  }) {
    final base = isDarkMode ? ThemeData.dark() : ThemeData.light();

    final textTheme = languageCode == 'ar'
        ? GoogleFonts.cairoTextTheme(base.textTheme)
        : GoogleFonts.interTextTheme(base.textTheme);

    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF6C63FF),
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}