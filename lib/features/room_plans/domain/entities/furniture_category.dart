enum FurnitureCategory {
  furniture('furniture', 'Furniture'),
  decor('decor', 'Decor'),
  lighting('lighting', 'Lighting'),
  storage('storage', 'Storage'),
  other('other', 'Other');

  const FurnitureCategory(this.value, this.fallbackLabel);

  final String value;
  final String fallbackLabel;

  static FurnitureCategory fromValue(String? value) {
    return FurnitureCategory.values.firstWhere(
      (category) => category.value == value,
      orElse: () => FurnitureCategory.other,
    );
  }
}