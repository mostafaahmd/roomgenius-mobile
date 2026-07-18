import '../enums/budget_level.dart';
import '../enums/design_mood.dart';
import '../enums/design_style.dart';
import '../enums/prompt_language.dart';
import '../enums/prompt_preset.dart';
import '../enums/room_type.dart';

class PromptRequest {
  const PromptRequest({
    required this.roomType,
    required this.designStyle,
    required this.designMood,
    required this.budgetLevel,
    required this.language,
    required this.preset,
    required this.colorPalette,
    required this.keepItems,
    required this.removeItems,
    required this.addItems,
    required this.extraNotes,
  });

  final RoomType roomType;
  final DesignStyle designStyle;
  final DesignMood designMood;
  final BudgetLevel budgetLevel;
  final PromptLanguage language;
  final PromptPreset preset;

  final List<String> colorPalette;
  final List<String> keepItems;
  final List<String> removeItems;
  final List<String> addItems;

  final String extraNotes;
}
