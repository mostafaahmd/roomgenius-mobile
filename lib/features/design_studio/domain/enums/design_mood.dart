enum DesignMood {
  calm,
  cozy,
  bright,
  warm,
  elegant,
  dramatic,
  earthy,
  clean,
  familyFriendly,
  luxurious,
}

extension DesignMoodX on DesignMood {
  String get value {
    switch (this) {
      case DesignMood.calm:
        return 'calm';
      case DesignMood.cozy:
        return 'cozy';
      case DesignMood.bright:
        return 'bright';
      case DesignMood.warm:
        return 'warm';
      case DesignMood.elegant:
        return 'elegant';
      case DesignMood.dramatic:
        return 'dramatic';
      case DesignMood.earthy:
        return 'earthy';
      case DesignMood.clean:
        return 'clean';
      case DesignMood.familyFriendly:
        return 'family_friendly';
      case DesignMood.luxurious:
        return 'luxurious';
    }
  }

  String get label {
    switch (this) {
      case DesignMood.calm:
        return 'Calm';
      case DesignMood.cozy:
        return 'Cozy';
      case DesignMood.bright:
        return 'Bright';
      case DesignMood.warm:
        return 'Warm';
      case DesignMood.elegant:
        return 'Elegant';
      case DesignMood.dramatic:
        return 'Dramatic';
      case DesignMood.earthy:
        return 'Earthy';
      case DesignMood.clean:
        return 'Clean';
      case DesignMood.familyFriendly:
        return 'Family-friendly';
      case DesignMood.luxurious:
        return 'Luxurious';
    }
  }

  String get promptLabel {
    switch (this) {
      case DesignMood.calm:
        return 'calm and relaxing';
      case DesignMood.cozy:
        return 'cozy and comfortable';
      case DesignMood.bright:
        return 'bright and airy';
      case DesignMood.warm:
        return 'warm and inviting';
      case DesignMood.elegant:
        return 'elegant and refined';
      case DesignMood.dramatic:
        return 'dramatic and expressive';
      case DesignMood.earthy:
        return 'earthy and natural';
      case DesignMood.clean:
        return 'clean and organized';
      case DesignMood.familyFriendly:
        return 'family-friendly and practical';
      case DesignMood.luxurious:
        return 'luxurious and premium';
    }
  }

  String get arabicLabel {
    switch (this) {
      case DesignMood.calm:
        return 'هادئ ومريح';
      case DesignMood.cozy:
        return 'دافئ ومريح';
      case DesignMood.bright:
        return 'مشرق وواسع بصريًا';
      case DesignMood.warm:
        return 'دافئ ومرحّب';
      case DesignMood.elegant:
        return 'أنيق وراقي';
      case DesignMood.dramatic:
        return 'درامي ولافت';
      case DesignMood.earthy:
        return 'طبيعي وهادئ';
      case DesignMood.clean:
        return 'نظيف ومنظم';
      case DesignMood.familyFriendly:
        return 'عملي ومناسب للعائلة';
      case DesignMood.luxurious:
        return 'فاخر وراقي';
    }
  }

  static DesignMood fromValue(String value) {
    return DesignMood.values.firstWhere(
      (mood) => mood.value == value,
      orElse: () => DesignMood.calm,
    );
  }
}
