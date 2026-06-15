import 'package:equatable/equatable.dart';

import '../enums/prompt_language.dart';
import '../enums/prompt_preset.dart';

class PromptVersion extends Equatable {
  const PromptVersion({
    required this.id,
    required this.versionNumber,
    required this.language,
    required this.preset,
    required this.positivePrompt,
    required this.negativePrompt,
    required this.createdAt,
  });

  final String id;
  final int versionNumber;
  final PromptLanguage language;
  final PromptPreset preset;
  final String positivePrompt;
  final String negativePrompt;
  final DateTime createdAt;

  @override
  List<Object?> get props => [
        id,
        versionNumber,
        language,
        preset,
        positivePrompt,
        negativePrompt,
        createdAt,
      ];
}