enum BudgetLevel {
  low,
  medium,
  high,
  premium,
}

extension BudgetLevelX on BudgetLevel {
  String get value {
    switch (this) {
      case BudgetLevel.low:
        return 'low';
      case BudgetLevel.medium:
        return 'medium';
      case BudgetLevel.high:
        return 'high';
      case BudgetLevel.premium:
        return 'premium';
    }
  }

  String get label {
    switch (this) {
      case BudgetLevel.low:
        return 'Budget-friendly';
      case BudgetLevel.medium:
        return 'Medium';
      case BudgetLevel.high:
        return 'High';
      case BudgetLevel.premium:
        return 'Premium';
    }
  }

  String get promptLabel {
    switch (this) {
      case BudgetLevel.low:
        return 'budget-friendly, practical, and cost-conscious';
      case BudgetLevel.medium:
        return 'balanced budget with good quality materials';
      case BudgetLevel.high:
        return 'high-end budget with refined finishes';
      case BudgetLevel.premium:
        return 'premium luxury budget with high-quality materials';
    }
  }

  String get arabicLabel {
    switch (this) {
      case BudgetLevel.low:
        return 'اقتصادي وعملي';
      case BudgetLevel.medium:
        return 'متوسط ومتوازن';
      case BudgetLevel.high:
        return 'مرتفع بخامات جيدة';
      case BudgetLevel.premium:
        return 'فاخر بخامات عالية الجودة';
    }
  }

  static BudgetLevel fromValue(String value) {
    return BudgetLevel.values.firstWhere(
      (level) => level.value == value,
      orElse: () => BudgetLevel.medium,
    );
  }
}
