import 'design_style.dart';
import 'furniture_item.dart';
import 'furniture_status.dart';
import 'room_type.dart';

class RoomPlan {
  const RoomPlan({
    required this.id,
    required this.name,
    required this.type,
    required this.width,
    required this.length,
    required this.budget,
    required this.style,
    required this.colorPalette,
    required this.notes,
    required this.checklist,
    required this.createdAt,
    required this.updatedAt,
    this.isSynced = false,
  });

  final String id;
  final String name;
  final RoomType type;
  final double width;
  final double length;
  final double budget;
  final DesignStyle style;
  final List<String> colorPalette;
  final String notes;
  final List<FurnitureItem> checklist;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;

  double get area => width * length;

  double get estimatedCost {
    return checklist.fold<double>(
      0,
      (total, item) => total + item.estimatedPrice,
    );
  }

  double get remainingBudget => budget - estimatedCost;

  bool get isOverBudget => estimatedCost > budget;

  int get boughtItemsCount {
    return checklist
        .where((item) => item.status == FurnitureStatus.bought)
        .length;
  }

  int get totalItemsCount => checklist.length;

  double get checklistProgress {
    if (checklist.isEmpty) return 0;
    return boughtItemsCount / checklist.length;
  }

  RoomPlan copyWith({
    String? id,
    String? name,
    RoomType? type,
    double? width,
    double? length,
    double? budget,
    DesignStyle? style,
    List<String>? colorPalette,
    String? notes,
    List<FurnitureItem>? checklist,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
  }) {
    return RoomPlan(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      width: width ?? this.width,
      length: length ?? this.length,
      budget: budget ?? this.budget,
      style: style ?? this.style,
      colorPalette: colorPalette ?? this.colorPalette,
      notes: notes ?? this.notes,
      checklist: checklist ?? this.checklist,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type.value,
      'width': width,
      'length': length,
      'budget': budget,
      'style': style.value,
      'colorPalette': colorPalette,
      'notes': notes,
      'checklist': checklist.map((item) => item.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isSynced': isSynced,
    };
  }

  factory RoomPlan.fromJson(Map<String, dynamic> json) {
    final checklistJson = json['checklist'];

    return RoomPlan(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      type: RoomType.fromValue(json['type'] as String? ?? ''),
      width: _toDouble(json['width']),
      length: _toDouble(json['length']),
      budget: _toDouble(json['budget']),
      style: DesignStyle.fromValue(json['style'] as String? ?? ''),
      colorPalette: _toStringList(json['colorPalette']),
      notes: json['notes'] as String? ?? '',
      checklist: checklistJson is List
          ? checklistJson
              .whereType<Map<String, dynamic>>()
              .map(
                (item) => FurnitureItem.fromJson(
                  Map<String, dynamic>.from(item),
                ),
              )
              .toList()
          : const [],
      createdAt: _toDateTime(json['createdAt']),
      updatedAt: _toDateTime(json['updatedAt']),
      isSynced: json['isSynced'] as bool? ?? false,
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

DateTime _toDateTime(dynamic value) {
  if (value is String) {
    return DateTime.tryParse(value) ?? DateTime.now();
  }

  return DateTime.now();
}

List<String> _toStringList(dynamic value) {
  if (value is List) {
    return value.map((item) => item.toString()).toList();
  }

  return const [];
}