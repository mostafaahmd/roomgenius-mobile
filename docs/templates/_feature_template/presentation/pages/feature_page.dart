import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/feature_view.dart';

class FeaturePage extends StatelessWidget {
  const FeaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => throw UnimplementedError(
        'Register FeatureCubit in the feature module and provide it here.',
      ),
      child: const FeatureView(),
    );
  }
}
