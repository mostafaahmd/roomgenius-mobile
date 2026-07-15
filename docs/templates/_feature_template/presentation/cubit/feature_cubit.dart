import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:roomgenius_mobile/core/error/result.dart';
import 'package:roomgenius_mobile/core/presentation/view_state.dart';
import '../../domain/entities/feature_entity.dart';
import '../../domain/usecases/get_feature_items_usecase.dart';

class FeatureCubit extends Cubit<ViewState<List<FeatureEntity>>> {
  FeatureCubit(this._getFeatureItemsUseCase) : super(const ViewState.initial());

  final GetFeatureItemsUseCase _getFeatureItemsUseCase;

  Future<void> load() async {
    emit(const ViewState.loading());

    final Result<List<FeatureEntity>> result = await _getFeatureItemsUseCase();

    switch (result) {
      case Success<List<FeatureEntity>>(:final data):
        emit(ViewState.success(data));
      case Err<List<FeatureEntity>>(:final failure):
        emit(ViewState.failure(failure.message));
    }
  }
}
