import '../../domain/entities/feature_entity.dart';
import '../dto/feature_item_dto.dart';

extension FeatureItemDtoMapper on FeatureItemDto {
  FeatureEntity toEntity() {
    return FeatureEntity(
      id: id,
      title: title,
    );
  }
}

extension FeatureItemDtoListMapper on List<FeatureItemDto> {
  List<FeatureEntity> toEntities() {
    return map((item) => item.toEntity()).toList(growable: false);
  }
}
