import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit(this._prefs) : super(const Locale('en')) {
    _loadSavedLocale();
  }

  final SharedPreferences _prefs;

  static const String _localeKey = 'app_locale';

  Future<void> _loadSavedLocale() async {
    final savedCode = _prefs.getString(_localeKey) ?? 'en';
    emit(Locale(savedCode));
  }

  Future<void> changeLanguage(String languageCode) async {
    await _prefs.setString(_localeKey, languageCode);
    emit(Locale(languageCode));
  }

  Future<void> setEnglish() async {
    await changeLanguage('en');
  }

  Future<void> setArabic() async {
    await changeLanguage('ar');
  }
}
