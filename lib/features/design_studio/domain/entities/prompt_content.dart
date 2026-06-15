import 'package:equatable/equatable.dart';

class PromptContent extends Equatable {
  const PromptContent({
    required this.positivePrompt,
    required this.negativePrompt,
  });

  final String positivePrompt;
  final String negativePrompt;

  @override
  List<Object?> get props => [
        positivePrompt,
        negativePrompt,
      ];
}