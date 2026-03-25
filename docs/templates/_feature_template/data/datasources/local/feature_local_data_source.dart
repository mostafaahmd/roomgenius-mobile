import '../../dto/feature_item_dto.dart';

abstract class FeatureLocalDataSource {
  Future<void> saveItems(List<FeatureItemDto> items);
  Future<List<FeatureItemDto>> getCachedItems();
  Future<void> clear();
}
