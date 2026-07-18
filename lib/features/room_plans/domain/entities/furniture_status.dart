enum FurnitureStatus {
  needed('needed', 'Needed'),
  bought('bought', 'Bought'),
  skipped('skipped', 'Skipped');

  const FurnitureStatus(this.value, this.fallbackLabel);

  final String value;
  final String fallbackLabel;

  static FurnitureStatus fromValue(String? value) {
    return FurnitureStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => FurnitureStatus.needed,
    );
  }
}
