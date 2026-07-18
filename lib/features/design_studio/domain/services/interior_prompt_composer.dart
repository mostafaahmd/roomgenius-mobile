import 'package:roomgenius_mobile/features/design_studio/domain/enums/budget_level.dart';
import 'package:roomgenius_mobile/features/design_studio/domain/enums/design_mood.dart';
import 'package:roomgenius_mobile/features/design_studio/domain/enums/design_style.dart';
import 'package:roomgenius_mobile/features/design_studio/domain/enums/room_type.dart';

import '../entities/prompt_content.dart';
import '../entities/prompt_request.dart';
import '../enums/prompt_language.dart';
import '../enums/prompt_preset.dart';
import 'prompt_composer.dart';

class InteriorPromptComposer implements PromptComposer {
  const InteriorPromptComposer();

  @override
  PromptContent compose(PromptRequest request) {
    final positivePrompt = switch (request.preset) {
      PromptPreset.midjourney => _composeVisualCompactPrompt(request),
      PromptPreset.stableDiffusion => _composeVisualCompactPrompt(request),
      PromptPreset.general ||
      PromptPreset.chatGpt ||
      PromptPreset.gemini =>
        request.language == PromptLanguage.arabic
            ? _composeArabicStructuredPrompt(request)
            : _composeEnglishStructuredPrompt(request),
    };

    final negativePrompt = request.language == PromptLanguage.arabic
        ? _composeArabicNegativePrompt()
        : _composeEnglishNegativePrompt();

    return PromptContent(
      positivePrompt: positivePrompt.trim(),
      negativePrompt: negativePrompt.trim(),
    );
  }

  String _composeEnglishStructuredPrompt(PromptRequest request) {
    return '''
You are an expert interior designer and photorealistic visualization director.

PROJECT OBJECTIVE:
Use the uploaded room photo as the source image and redesign the same exact ${request.roomType.promptLabel} into a ${request.designStyle.promptLabel} space with a ${request.designMood.promptLabel} atmosphere.

STRICT ARCHITECTURAL PRESERVATION:
Preserve the existing room layout, camera angle, perspective, image framing, wall positions, ceiling height, floor level, windows, doors, openings, columns, power outlets, switches, and all fixed architectural elements. Do not change the room proportions, do not crop the image differently, and do not create a different space.

ELEMENTS TO KEEP:
${_formatEnglishList(request.keepItems, fallback: 'Keep the main architectural structure, room layout, and any visually important existing elements.')}

ELEMENTS TO REMOVE OR IMPROVE:
${_formatEnglishList(request.removeItems, fallback: 'Reduce visual clutter, outdated details, poor lighting, and inconsistent decoration.')}

ELEMENTS TO ADD:
${_formatEnglishList(request.addItems, fallback: 'Add cohesive furniture, balanced decoration, improved lighting, and functional styling suitable for the room.')}

COLOR AND MATERIAL DIRECTION:
${_formatEnglishList(request.colorPalette, fallback: 'Use a harmonious, realistic, interior-friendly color palette with balanced materials and finishes.')}

BUDGET AND PRACTICALITY:
Design according to a ${request.budgetLevel.promptLabel} direction. The result should feel achievable, functional, and suitable for a real home.

LIGHTING:
Improve the lighting using realistic natural and artificial light. Keep shadows, reflections, and material behavior physically believable.

REALISM AND OUTPUT QUALITY:
Create a highly realistic interior design visualization. Use correct scale, realistic furniture proportions, coherent styling, clean composition, natural textures, and professional interior photography quality.

ADDITIONAL INSTRUCTIONS:
${request.extraNotes.trim().isEmpty ? 'Keep the design elegant, practical, and visually cohesive without over-styling the room.' : request.extraNotes.trim()}
''';
  }

  String _composeArabicStructuredPrompt(PromptRequest request) {
    return '''
أنت مصمم داخلي محترف ومتخصص في إعداد تصورات واقعية عالية الجودة للمساحات الداخلية.

هدف المشروع:
استخدم صورة الغرفة المرفوعة كمرجع أساسي، وأعد تصميم نفس ${request.roomType.arabicLabel} بأسلوب ${request.designStyle.arabicLabel} وبإحساس عام ${request.designMood.arabicLabel}.

الحفاظ الصارم على التكوين المعماري:
يجب الحفاظ على نفس توزيع الغرفة، زاوية التصوير، المنظور، إطار الصورة، أماكن الحوائط، ارتفاع السقف، مستوى الأرضية، الشبابيك، الأبواب، الفتحات، الأعمدة، مفاتيح الكهرباء، البرايز، وأي عناصر معمارية ثابتة. لا تغيّر أبعاد الغرفة، لا تقص الصورة بشكل مختلف، ولا تحولها إلى مساحة مختلفة.

العناصر المطلوب الحفاظ عليها:
${_formatArabicList(request.keepItems, fallback: 'حافظ على التكوين المعماري الأساسي، توزيع الغرفة، والعناصر الحالية المهمة بصريًا.')}

العناصر المطلوب إزالتها أو تحسينها:
${_formatArabicList(request.removeItems, fallback: 'قلّل الفوضى البصرية، التفاصيل القديمة، الإضاءة الضعيفة، والعناصر غير المتناسقة.')}

العناصر المطلوب إضافتها:
${_formatArabicList(request.addItems, fallback: 'أضف أثاثًا متناسقًا، إضاءة أفضل، ديكورًا عمليًا، وتفاصيل مناسبة لطبيعة الغرفة.')}

اتجاه الألوان والخامات:
${_formatArabicList(request.colorPalette, fallback: 'استخدم لوحة ألوان متناسقة وواقعية مناسبة للتصميم الداخلي مع خامات متوازنة.')}

الميزانية والواقعية:
نفّذ التصميم باتجاه ${request.budgetLevel.arabicLabel}. يجب أن يكون التصميم قابلًا للتنفيذ، عمليًا، ومناسبًا لمنزل حقيقي.

الإضاءة:
حسّن الإضاءة بشكل واقعي باستخدام إضاءة طبيعية وصناعية متوازنة، مع ظلال وانعكاسات وخامات منطقية.

جودة النتيجة:
أنشئ تصورًا داخليًا واقعيًا جدًا، بمقاسات أثاث صحيحة، توزيع متزن، خامات طبيعية، وتكوين بصري احترافي.

ملاحظات إضافية:
${request.extraNotes.trim().isEmpty ? 'اجعل التصميم أنيقًا، عمليًا، ومتناسقًا بدون مبالغة في التفاصيل.' : request.extraNotes.trim()}
''';
  }

  String _composeVisualCompactPrompt(PromptRequest request) {
    final roomType = request.language == PromptLanguage.arabic
        ? request.roomType.arabicLabel
        : request.roomType.promptLabel;

    final style = request.language == PromptLanguage.arabic
        ? request.designStyle.arabicLabel
        : request.designStyle.promptLabel;

    final mood = request.language == PromptLanguage.arabic
        ? request.designMood.arabicLabel
        : request.designMood.promptLabel;

    final budget = request.language == PromptLanguage.arabic
        ? request.budgetLevel.arabicLabel
        : request.budgetLevel.promptLabel;

    final palette = request.colorPalette.isEmpty
        ? 'harmonious realistic interior color palette'
        : request.colorPalette.join(', ');

    final keep = request.keepItems.isEmpty
        ? 'preserve existing architecture and room layout'
        : 'preserve ${request.keepItems.join(', ')}';

    final remove = request.removeItems.isEmpty
        ? 'reduce clutter and outdated details'
        : 'remove or improve ${request.removeItems.join(', ')}';

    final add = request.addItems.isEmpty
        ? 'add cohesive furniture, lighting, decor'
        : 'add ${request.addItems.join(', ')}';

    return '''
$roomType, $style, $mood atmosphere, $palette, $keep, $remove, $add, $budget, photorealistic interior design, realistic scale, professional interior photography, natural light, balanced composition, high-quality materials, clean realistic styling
''';
  }

  String _composeEnglishNegativePrompt() {
    return '''
Do not change the room layout.
Do not move windows, doors, walls, openings, columns, or fixed architectural elements.
Do not change the camera angle or perspective.
Do not create a different room.
No distorted furniture.
No floating objects.
No duplicated furniture.
No warped geometry.
No unrealistic lighting.
No impossible shadows.
No low-quality textures.
No cluttered composition.
No people, text, captions, labels, logos, or watermarks.
No blurry output.
''';
  }

  String _composeArabicNegativePrompt() {
    return '''
لا تغيّر توزيع الغرفة.
لا تحرّك الشبابيك أو الأبواب أو الحوائط أو الفتحات أو الأعمدة أو العناصر المعمارية الثابتة.
لا تغيّر زاوية التصوير أو المنظور.
لا تنشئ غرفة مختلفة.
لا تضف أثاثًا مشوهًا.
لا تضف عناصر طائرة أو غير منطقية.
لا تكرر قطع الأثاث بشكل غير طبيعي.
لا تشوه الهندسة أو أبعاد الغرفة.
لا تستخدم إضاءة غير واقعية.
لا تستخدم ظلالًا مستحيلة.
لا تستخدم خامات منخفضة الجودة.
لا تجعل التكوين مزدحمًا.
لا تضف أشخاصًا.
لا تضف نصوصًا.
لا تضف شعارات.
لا تضف علامة مائية.
لا تجعل النتيجة ضبابية.
''';
  }

  String _formatEnglishList(
    List<String> values, {
    required String fallback,
  }) {
    if (values.isEmpty) {
      return fallback;
    }

    return values.map((value) => '- $value').join('\n');
  }

  String _formatArabicList(
    List<String> values, {
    required String fallback,
  }) {
    if (values.isEmpty) {
      return fallback;
    }

    return values.map((value) => '- $value').join('\n');
  }
}
