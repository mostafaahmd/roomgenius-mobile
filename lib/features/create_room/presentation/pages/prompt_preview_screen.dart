import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomgenius_mobile/features/create_room/presentation/cubit/create_room_cubit.dart';
import 'package:roomgenius_mobile/features/create_room/presentation/cubit/create_room_state.dart';
import 'package:roomgenius_mobile/features/design_studio/domain/enums/prompt_language.dart';
import 'package:roomgenius_mobile/features/design_studio/domain/enums/prompt_preset.dart';

import '../../../design_studio/domain/enums/budget_level.dart';
import '../../../design_studio/domain/enums/design_mood.dart';
import '../../../design_studio/domain/enums/design_style.dart';
import '../../../design_studio/domain/enums/room_type.dart';

class PromptPreviewScreen extends StatelessWidget {
  const PromptPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRoomCubit, CreateRoomState>(
      builder: (context, state) {
        final draft = state.draft;
        final promptContent =
            context.read<CreateRoomCubit>().buildPromptPreview();

        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              'Prompt preview',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Review your AI-ready interior design prompt before saving it to your design studio.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            if (draft.imagePath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.file(
                  File(draft.imagePath!),
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 20),
            Text(
              'Positive prompt',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
              child: SelectableText(promptContent.positivePrompt),
            ),
            const SizedBox(height: 20),
            Text(
              'Negative prompt',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
              child: SelectableText(promptContent.negativePrompt),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (draft.roomType != null)
                  Chip(label: Text(draft.roomType!.label)),
                if (draft.designStyle != null)
                  Chip(label: Text(draft.designStyle!.label)),
                if (draft.designMood != null)
                  Chip(label: Text(draft.designMood!.label)),
                if (draft.budgetLevel != null)
                  Chip(label: Text(draft.budgetLevel!.label)),
                Chip(label: Text(draft.promptLanguage.label)),
                Chip(label: Text(draft.promptPreset.label)),
              ],
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () async {
                await Clipboard.setData(
                  ClipboardData(
                    text: '''
POSITIVE PROMPT:

${promptContent.positivePrompt}

NEGATIVE PROMPT:

${promptContent.negativePrompt}
''',
                  ),
                );

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Prompt copied to clipboard.'),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.copy),
              label: const Text('Copy Prompt'),
            ),
          ],
        );
      },
    );
  }
}
