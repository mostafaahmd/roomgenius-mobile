import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomgenius_mobile/features/create_room/presentation/cubit/create_room_cubit.dart';

import '../../../design_studio/domain/enums/design_style.dart';
import '../cubit/create_room_state.dart';
import '../widgets/selectable_option_card.dart';

class SelectDesignStyleScreen extends StatelessWidget {
  const SelectDesignStyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRoomCubit, CreateRoomState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              'Choose a design style',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'This controls the visual direction of the generated prompt.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: DesignStyle.values.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.45,
              ),
              itemBuilder: (context, index) {
                final style = DesignStyle.values[index];

                return SelectableOptionCard(
                  title: style.label,
                  isSelected: state.draft.designStyle == style,
                  icon: Icons.auto_awesome_outlined,
                  onTap: () {
                    context
                        .read<CreateRoomCubit>()
                        .selectDesignStyle(style);
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