import '../../../../../lib/core/error/result.dart';
import '../entities/feature_entity.dart';

abstract class FeatureRepository {
  Future<Result<List<FeatureEntity>>> getItems();
}
