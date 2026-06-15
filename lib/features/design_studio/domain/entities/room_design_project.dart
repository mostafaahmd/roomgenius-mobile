import 'package:equatable/equatable.dart';

import '../enums/budget_level.dart';
import '../enums/design_mood.dart';
import '../enums/design_style.dart';
import '../enums/room_type.dart';
import 'prompt_version.dart';

class RoomDesignProject extends Equatable {
  const RoomDesignProject({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.roomType,
    required this.designStyle,
    required this.designMood,
    required this.budgetLevel,
    required this.colorPalette,
    required this.keepItems,
    required this.removeItems,
    required this.addItems,
    required this.extraNotes,
    required this.promptVersions,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final String imagePath;

  final RoomType roomType;
  final DesignStyle designStyle;
  final DesignMood designMood;
  final BudgetLevel budgetLevel;

  final List<String> colorPalette;
  final List<String> keepItems;
  final List<String> removeItems;
  final List<String> addItems;

  final String extraNotes;
  final List<PromptVersion> promptVersions;

  final DateTime createdAt;
  final DateTime updatedAt;

  PromptVersion? get latestPromptVersion {
    if (promptVersions.isEmpty) return null;

    final sortedVersions = [...promptVersions]..sort(
        (a, b) => b.versionNumber.compareTo(a.versionNumber),
      );

    return sortedVersions.first;
  }

  RoomDesignProject copyWith({
    String? id,
    String? name,
    String? imagePath,
    RoomType? roomType,
    DesignStyle? designStyle,
    DesignMood? designMood,
    BudgetLevel? budgetLevel,
    List<String>? colorPalette,
    List<String>? keepItems,
    List<String>? removeItems,
    List<String>? addItems,
    String? extraNotes,
    List<PromptVersion>? promptVersions,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return RoomDesignProject(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      roomType: roomType ?? this.roomType,
      designStyle: designStyle ?? this.designStyle,
      designMood: designMood ?? this.designMood,
      budgetLevel: budgetLevel ?? this.budgetLevel,
      colorPalette: colorPalette ?? this.colorPalette,
      keepItems: keepItems ?? this.keepItems,
      removeItems: removeItems ?? this.removeItems,
      addItems: addItems ?? this.addItems,
      extraNotes: extraNotes ?? this.extraNotes,
      promptVersions: promptVersions ?? this.promptVersions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        imagePath,
        roomType,
        designStyle,
        designMood,
        budgetLevel,
        colorPalette,
        keepItems,
        removeItems,
        addItems,
        extraNotes,
        promptVersions,
        createdAt,
        updatedAt,
      ];
}