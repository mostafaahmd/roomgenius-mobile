import 'furniture_category.dart';
import 'furniture_status.dart';

class FurnitureItem {
  const FurnitureItem({
    required this.id,
    required this.title,
    required this.estimatedPrice,
    required this.category,
    required this.status,
  });

  final String id;
  final String title;
  final double estimatedPrice;
  final FurnitureCategory category;
  final FurnitureStatus status;

  FurnitureItem copyWith({
    String? id,
    String? title,
    double? estimatedPrice,
    FurnitureCategory? category,
    FurnitureStatus? status,
  }) {
    return FurnitureItem(
      id: id ?? this.id,
      title: title ?? this.title,
      estimatedPrice: estimatedPrice ?? this.estimatedPrice,
      category: category ?? this.category,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'estimatedPrice': estimatedPrice,
      'category': category.value,
      'status': status.value,
    };
  }

  factory FurnitureItem.fromJson(Map<String, dynamic> json) {
    return FurnitureItem(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      estimatedPrice: _toDouble(json['estimatedPrice']),
      category: FurnitureCategory.fromValue(json['category'] as String?),
      status: FurnitureStatus.fromValue(json['status'] as String?),
    );
  }
}

double _toDouble(dynamic value) {
  if (value == null) return 0;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0;
  return 0;
}