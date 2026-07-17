import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:roomgenius_mobile/core/presentation/view_state.dart';
import '../../domain/entities/feature_entity.dart';
import '../cubit/feature_cubit.dart';

class FeatureView extends StatelessWidget {
  const FeatureView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureCubit, ViewState<List<FeatureEntity>>>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.isFailure) {
          return Center(child: Text(state.message ?? 'Something went wrong'));
        }

        final items = state.data ?? const <FeatureEntity>[];
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index].title),
            );
          },
        );
      },
    );
  }
}
