import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomgenius_mobile/features/create_room/presentation/cubit/create_room_cubit.dart';
import 'package:roomgenius_mobile/features/create_room/presentation/cubit/create_room_state.dart';
import 'package:roomgenius_mobile/features/design_studio/domain/enums/prompt_language.dart';
import 'package:roomgenius_mobile/features/design_studio/domain/enums/prompt_preset.dart';

import '../../../design_studio/domain/enums/budget_level.dart';
import '../widgets/selectable_option_card.dart';

class RefineDetailsScreen extends StatelessWidget {
  const RefineDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateRoomCubit>();

    return BlocBuilder<CreateRoomCubit, CreateRoomState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              'Refine your prompt',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Add practical details to make the prompt more useful.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            Text(
              'Budget level',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: BudgetLevel.values.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.8,
              ),
              itemBuilder: (context, index) {
                final budget = BudgetLevel.values[index];

                return SelectableOptionCard(
                  title: budget.label,
                  isSelected: state.draft.budgetLevel == budget,
                  onTap: () => cubit.selectBudgetLevel(budget),
                );
              },
            ),
            const SizedBox(height: 24),
            Text(
              'Prompt language',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: PromptLanguage.values.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 2.2,
              ),
              itemBuilder: (context, index) {
                final language = PromptLanguage.values[index];

                return SelectableOptionCard(
                  title: language.label,
                  isSelected: state.draft.promptLanguage == language,
                  onTap: () => cubit.selectPromptLanguage(language),
                );
              },
            ),
            const SizedBox(height: 24),
            Text(
              'Prompt preset',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: PromptPreset.values.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 2.2,
              ),
              itemBuilder: (context, index) {
                final preset = PromptPreset.values[index];

                return SelectableOptionCard(
                  title: preset.label,
                  isSelected: state.draft.promptPreset == preset,
                  onTap: () => cubit.selectPromptPreset(preset),
                );
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Preferred color palette',
                hintText: 'Example: warm beige, oak wood, soft white',
                border: OutlineInputBorder(),
              ),
              onChanged: cubit.updateColorPalette,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Items to preserve',
                hintText: 'Example: windows, flooring, sofa',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                cubit.updateKeepItems(_splitInput(value));
              },
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Items to remove or improve',
                hintText: 'Example: clutter, old curtains, dark lighting',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                cubit.updateRemoveItems(_splitInput(value));
              },
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Items to add',
                hintText: 'Example: plants, rug, wall art, warm lighting',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                cubit.updateAddItems(_splitInput(value));
              },
            ),
            const SizedBox(height: 16),
            TextField(
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Extra notes',
                hintText: 'Any specific instructions?',
                border: OutlineInputBorder(),
              ),
              onChanged: cubit.updateExtraNotes,
            ),
          ],
        );
      },
    );
  }

  List<String> _splitInput(String value) {
    return value
        .split(',')
        .map((item) => item.trim())
        .where((item) => item.isNotEmpty)
        .toList();
  }
}
