import '../../dto/feature_item_dto.dart';

abstract class FeatureRemoteDataSource {
  Future<List<FeatureItemDto>> getItems();
}
