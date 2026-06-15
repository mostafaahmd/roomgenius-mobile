enum PromptLanguage {
  english,
  arabic,
}

extension PromptLanguageX on PromptLanguage {
  String get value {
    switch (this) {
      case PromptLanguage.english:
        return 'english';
      case PromptLanguage.arabic:
        return 'arabic';
    }
  }

  String get label {
    switch (this) {
      case PromptLanguage.english:
        return 'English';
      case PromptLanguage.arabic:
        return 'Arabic';
    }
  }

  static PromptLanguage fromValue(String value) {
    return PromptLanguage.values.firstWhere(
      (language) => language.value == value,
      orElse: () => PromptLanguage.english,
    );
  }
}