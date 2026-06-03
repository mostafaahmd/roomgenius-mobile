enum DesignStyle {
  minimalist('minimalist', 'Minimalist'),
  modern('modern', 'Modern'),
  scandinavian('scandinavian', 'Scandinavian'),
  boho('boho', 'Boho'),
  classic('classic', 'Classic'),
  luxury('luxury', 'Luxury');

  const DesignStyle(this.value, this.fallbackLabel);

  final String value;
  final String fallbackLabel;

  static DesignStyle fromValue(String? value) {
    return DesignStyle.values.firstWhere(
      (style) => style.value == value,
      orElse: () => DesignStyle.modern,
    );
  }
}