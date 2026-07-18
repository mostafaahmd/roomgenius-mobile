import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomgenius_mobile/features/create_room/presentation/cubit/create_room_cubit.dart';
import 'package:roomgenius_mobile/features/create_room/presentation/cubit/create_room_state.dart';
import 'package:roomgenius_mobile/features/create_room/presentation/widgets/selectable_option_card.dart';

import '../../../design_studio/domain/enums/room_type.dart';

class SelectRoomTypeScreen extends StatelessWidget {
  const SelectRoomTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRoomCubit, CreateRoomState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              'What room are you redesigning?',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Select the room type so the prompt can be more accurate.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: RoomType.values.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.45,
              ),
              itemBuilder: (context, index) {
                final roomType = RoomType.values[index];

                return SelectableOptionCard(
                  title: roomType.label,
                  isSelected: state.draft.roomType == roomType,
                  icon: Icons.chair_outlined,
                  onTap: () {
                    context.read<CreateRoomCubit>().selectRoomType(roomType);
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
