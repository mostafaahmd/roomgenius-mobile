import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:roomgenius_mobile/app/routing/routes.dart';

import '../cubit/room_plans_cubit.dart';
import '../cubit/room_plans_state.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Rooms'),
      ),
      body: BlocBuilder<RoomPlansCubit, RoomPlansState>(
        builder: (context, state) {
          if (state.status == RoomPlansStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.status == RoomPlansStatus.failure) {
            return Center(
              child: Text(state.errorMessage ?? 'Something went wrong'),
            );
          }

          if (state.status == RoomPlansStatus.empty) {
            return const Center(
              child: Text('No room plans yet.'),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.plans.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final plan = state.plans[index];

              return Card(
                child: ListTile(
                  title: Text(plan.name),
                  subtitle: Text(
                    '${plan.type.fallbackLabel} • ${plan.area.toStringAsFixed(1)} m²',
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    context.pushNamed(
                      RouteNames.roomDetails,
                      pathParameters: {'id': plan.id},
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.pushNamed(RouteNames.createRoom);
        },
        label: const Text('Create Room'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
