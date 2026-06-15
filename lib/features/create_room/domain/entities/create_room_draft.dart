import 'package:roomgenius_mobile/features/design_studio/domain/enums/prompt_language.dart';
import 'package:roomgenius_mobile/features/design_studio/domain/enums/prompt_preset.dart';

import '../../../design_studio/domain/enums/budget_level.dart';
import '../../../design_studio/domain/enums/design_mood.dart';
import '../../../design_studio/domain/enums/design_style.dart';
import '../../../design_studio/domain/enums/room_type.dart';

class CreateRoomDraft {
  const CreateRoomDraft({
    this.imagePath,
    this.roomType,
    this.designStyle,
    this.designMood,
    this.budgetLevel,
    this.promptLanguage = PromptLanguage.english,
    this.promptPreset = PromptPreset.general,
    this.colorPalette = '',
    this.keepItems = const [],
    this.removeItems = const [],
    this.addItems = const [],
    this.extraNotes = '',
  });

  final String? imagePath;
  final RoomType? roomType;
  final DesignStyle? designStyle;
  final DesignMood? designMood;
  final BudgetLevel? budgetLevel;
  final PromptLanguage promptLanguage;
  final PromptPreset promptPreset;
  final String colorPalette;
  final List<String> keepItems;
  final List<String> removeItems;
  final List<String> addItems;
  final String extraNotes;

  bool get hasImage => imagePath != null && imagePath!.isNotEmpty;

  bool get canSelectRoomType => hasImage;

  bool get canSelectStyle => hasImage && roomType != null;

  bool get canSelectMood => canSelectStyle && designStyle != null;

  bool get canRefineDetails => canSelectMood && designMood != null;

  bool get canPreviewPrompt {
    return hasImage &&
        roomType != null &&
        designStyle != null &&
        designMood != null &&
        budgetLevel != null;
  }

  CreateRoomDraft copyWith({
    String? imagePath,
    RoomType? roomType,
    DesignStyle? designStyle,
    DesignMood? designMood,
    BudgetLevel? budgetLevel,
    PromptLanguage? promptLanguage,
    PromptPreset? promptPreset,
    String? colorPalette,
    List<String>? keepItems,
    List<String>? removeItems,
    List<String>? addItems,
    String? extraNotes,
  }) {
    return CreateRoomDraft(
      imagePath: imagePath ?? this.imagePath,
      roomType: roomType ?? this.roomType,
      designStyle: designStyle ?? this.designStyle,
      designMood: designMood ?? this.designMood,
      budgetLevel: budgetLevel ?? this.budgetLevel,
      promptLanguage: promptLanguage ?? this.promptLanguage,
      promptPreset: promptPreset ?? this.promptPreset,
      colorPalette: colorPalette ?? this.colorPalette,
      keepItems: keepItems ?? this.keepItems,
      removeItems: removeItems ?? this.removeItems,
      addItems: addItems ?? this.addItems,
      extraNotes: extraNotes ?? this.extraNotes,
    );
  }
}