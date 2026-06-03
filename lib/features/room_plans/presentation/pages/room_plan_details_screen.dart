import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/room_plans_cubit.dart';
import '../cubit/room_plans_state.dart';

class RoomPlanDetailsScreen extends StatelessWidget {
  const RoomPlanDetailsScreen({
    required this.planId,
    super.key,
  });

  final String planId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Room Details'),
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
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  state.errorMessage ?? 'Room project was not found.',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final plan = state.selectedPlan;

          if (plan == null) {
            return const Center(
              child: Text('Room project was not found.'),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                plan.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              _InfoTile(
                label: 'Room Type',
                value: plan.type.fallbackLabel,
              ),
              _InfoTile(
                label: 'Style',
                value: plan.style.fallbackLabel,
              ),
              _InfoTile(
                label: 'Area',
                value: '${plan.area.toStringAsFixed(1)} m²',
              ),
              _InfoTile(
                label: 'Budget',
                value: '${plan.budget.toStringAsFixed(0)} EGP',
              ),
              _InfoTile(
                label: 'Color Palette',
                value: plan.colorPalette.isEmpty
                    ? 'Not selected'
                    : plan.colorPalette.join(', '),
              ),
              const SizedBox(height: 16),
              Text(
                'Notes',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                plan.notes.trim().isEmpty ? 'No notes added.' : plan.notes,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(label),
        subtitle: Text(value),
      ),
    );
  }
}