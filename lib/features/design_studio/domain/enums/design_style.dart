enum DesignStyle {
  modern,
  minimalist,
  japandi,
  scandinavian,
  bohemian,
  industrial,
  luxury,
  midCentury,
  coastal,
  traditional,
}

extension DesignStyleX on DesignStyle {
  String get value {
    switch (this) {
      case DesignStyle.modern:
        return 'modern';
      case DesignStyle.minimalist:
        return 'minimalist';
      case DesignStyle.japandi:
        return 'japandi';
      case DesignStyle.scandinavian:
        return 'scandinavian';
      case DesignStyle.bohemian:
        return 'bohemian';
      case DesignStyle.industrial:
        return 'industrial';
      case DesignStyle.luxury:
        return 'luxury';
      case DesignStyle.midCentury:
        return 'mid_century';
      case DesignStyle.coastal:
        return 'coastal';
      case DesignStyle.traditional:
        return 'traditional';
    }
  }

  String get label {
    switch (this) {
      case DesignStyle.modern:
        return 'Modern';
      case DesignStyle.minimalist:
        return 'Minimalist';
      case DesignStyle.japandi:
        return 'Japandi';
      case DesignStyle.scandinavian:
        return 'Scandinavian';
      case DesignStyle.bohemian:
        return 'Bohemian';
      case DesignStyle.industrial:
        return 'Industrial';
      case DesignStyle.luxury:
        return 'Luxury';
      case DesignStyle.midCentury:
        return 'Mid-century';
      case DesignStyle.coastal:
        return 'Coastal';
      case DesignStyle.traditional:
        return 'Traditional';
    }
  }

  String get promptLabel {
    switch (this) {
      case DesignStyle.modern:
        return 'modern interior design';
      case DesignStyle.minimalist:
        return 'minimalist interior design';
      case DesignStyle.japandi:
        return 'Japandi interior design';
      case DesignStyle.scandinavian:
        return 'Scandinavian interior design';
      case DesignStyle.bohemian:
        return 'bohemian interior design';
      case DesignStyle.industrial:
        return 'industrial interior design';
      case DesignStyle.luxury:
        return 'luxury interior design';
      case DesignStyle.midCentury:
        return 'mid-century modern interior design';
      case DesignStyle.coastal:
        return 'coastal interior design';
      case DesignStyle.traditional:
        return 'traditional interior design';
    }
  }

  String get arabicLabel {
    switch (this) {
      case DesignStyle.modern:
        return 'تصميم مودرن';
      case DesignStyle.minimalist:
        return 'تصميم مينيمال';
      case DesignStyle.japandi:
        return 'تصميم جاباندي';
      case DesignStyle.scandinavian:
        return 'تصميم إسكندنافي';
      case DesignStyle.bohemian:
        return 'تصميم بوهيمي';
      case DesignStyle.industrial:
        return 'تصميم صناعي';
      case DesignStyle.luxury:
        return 'تصميم فاخر';
      case DesignStyle.midCentury:
        return 'تصميم ميد-سنشري مودرن';
      case DesignStyle.coastal:
        return 'تصميم ساحلي';
      case DesignStyle.traditional:
        return 'تصميم كلاسيكي تقليدي';
    }
  }

  static DesignStyle fromValue(String value) {
    return DesignStyle.values.firstWhere(
      (style) => style.value == value,
      orElse: () => DesignStyle.modern,
    );
  }
}
