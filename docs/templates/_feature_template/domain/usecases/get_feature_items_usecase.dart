import '../../../../../lib/core/error/result.dart';
import '../entities/feature_entity.dart';
import '../repositories/feature_repository.dart';

class GetFeatureItemsUseCase {
  const GetFeatureItemsUseCase(this._repository);

  final FeatureRepository _repository;

  Future<Result<List<FeatureEntity>>> call() {
    return _repository.getItems();
  }
}
