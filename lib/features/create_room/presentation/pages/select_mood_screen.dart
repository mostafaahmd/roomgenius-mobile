import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../design_studio/domain/enums/design_mood.dart';
import '../cubit/create_room_cubit.dart';
import '../cubit/create_room_state.dart';
import '../widgets/selectable_option_card.dart';

class SelectDesignMoodScreen extends StatelessWidget {
  const SelectDesignMoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRoomCubit, CreateRoomState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              'Pick the mood',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'The mood helps shape lighting, colors, and atmosphere.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: DesignMood.values.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.45,
              ),
              itemBuilder: (context, index) {
                final mood = DesignMood.values[index];

                return SelectableOptionCard(
                  title: mood.label,
                  isSelected: state.draft.designMood == mood,
                  icon: Icons.wb_sunny_outlined,
                  onTap: () {
                    context.read<CreateRoomCubit>().selectDesignMood(mood);
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
