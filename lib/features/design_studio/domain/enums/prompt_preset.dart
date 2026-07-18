enum PromptPreset {
  general,
  chatGpt,
  gemini,
  midjourney,
  stableDiffusion,
}

extension PromptPresetX on PromptPreset {
  String get value {
    switch (this) {
      case PromptPreset.general:
        return 'general';
      case PromptPreset.chatGpt:
        return 'chat_gpt';
      case PromptPreset.gemini:
        return 'gemini';
      case PromptPreset.midjourney:
        return 'midjourney';
      case PromptPreset.stableDiffusion:
        return 'stable_diffusion';
    }
  }

  String get label {
    switch (this) {
      case PromptPreset.general:
        return 'General';
      case PromptPreset.chatGpt:
        return 'ChatGPT';
      case PromptPreset.gemini:
        return 'Gemini';
      case PromptPreset.midjourney:
        return 'Midjourney';
      case PromptPreset.stableDiffusion:
        return 'Stable Diffusion';
    }
  }

  static PromptPreset fromValue(String value) {
    return PromptPreset.values.firstWhere(
      (preset) => preset.value == value,
      orElse: () => PromptPreset.general,
    );
  }
}
