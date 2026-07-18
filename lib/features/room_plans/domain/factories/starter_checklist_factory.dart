import '../entities/furniture_category.dart';
import '../entities/furniture_item.dart';
import '../entities/furniture_status.dart';
import '../entities/room_type.dart';

class StarterChecklistFactory {
  const StarterChecklistFactory._();

  static List<FurnitureItem> createForRoomType(RoomType type) {
    return switch (type) {
      RoomType.bedroom => _bedroomItems,
      RoomType.livingRoom => _livingRoomItems,
      RoomType.office => _officeItems,
      RoomType.kidsRoom => _kidsRoomItems,
      RoomType.kitchen => _kitchenItems,
      RoomType.bathroom => _bathroomItems,
    };
  }

  static List<FurnitureItem> get _bedroomItems {
    return const [
      FurnitureItem(
        id: 'bed',
        title: 'Bed',
        estimatedPrice: 0,
        category: FurnitureCategory.furniture,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'wardrobe',
        title: 'Wardrobe',
        estimatedPrice: 0,
        category: FurnitureCategory.storage,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'nightstand',
        title: 'Nightstand',
        estimatedPrice: 0,
        category: FurnitureCategory.furniture,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'curtains',
        title: 'Curtains',
        estimatedPrice: 0,
        category: FurnitureCategory.decor,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'lighting',
        title: 'Lighting',
        estimatedPrice: 0,
        category: FurnitureCategory.lighting,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'rug',
        title: 'Rug',
        estimatedPrice: 0,
        category: FurnitureCategory.decor,
        status: FurnitureStatus.needed,
      ),
    ];
  }

  static List<FurnitureItem> get _livingRoomItems {
    return const [
      FurnitureItem(
        id: 'sofa',
        title: 'Sofa',
        estimatedPrice: 0,
        category: FurnitureCategory.furniture,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'coffee_table',
        title: 'Coffee Table',
        estimatedPrice: 0,
        category: FurnitureCategory.furniture,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'tv_unit',
        title: 'TV Unit',
        estimatedPrice: 0,
        category: FurnitureCategory.storage,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'curtains',
        title: 'Curtains',
        estimatedPrice: 0,
        category: FurnitureCategory.decor,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'lighting',
        title: 'Lighting',
        estimatedPrice: 0,
        category: FurnitureCategory.lighting,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'rug',
        title: 'Rug',
        estimatedPrice: 0,
        category: FurnitureCategory.decor,
        status: FurnitureStatus.needed,
      ),
    ];
  }

  static List<FurnitureItem> get _officeItems {
    return const [
      FurnitureItem(
        id: 'desk',
        title: 'Desk',
        estimatedPrice: 0,
        category: FurnitureCategory.furniture,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'chair',
        title: 'Chair',
        estimatedPrice: 0,
        category: FurnitureCategory.furniture,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'shelves',
        title: 'Shelves',
        estimatedPrice: 0,
        category: FurnitureCategory.storage,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'desk_lamp',
        title: 'Desk Lamp',
        estimatedPrice: 0,
        category: FurnitureCategory.lighting,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'cable_management',
        title: 'Cable Management',
        estimatedPrice: 0,
        category: FurnitureCategory.other,
        status: FurnitureStatus.needed,
      ),
    ];
  }

  static List<FurnitureItem> get _kidsRoomItems {
    return const [
      FurnitureItem(
        id: 'kids_bed',
        title: 'Kids Bed',
        estimatedPrice: 0,
        category: FurnitureCategory.furniture,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'wardrobe',
        title: 'Wardrobe',
        estimatedPrice: 0,
        category: FurnitureCategory.storage,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'study_desk',
        title: 'Study Desk',
        estimatedPrice: 0,
        category: FurnitureCategory.furniture,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'toy_storage',
        title: 'Toy Storage',
        estimatedPrice: 0,
        category: FurnitureCategory.storage,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'soft_lighting',
        title: 'Soft Lighting',
        estimatedPrice: 0,
        category: FurnitureCategory.lighting,
        status: FurnitureStatus.needed,
      ),
    ];
  }

  static List<FurnitureItem> get _kitchenItems {
    return const [
      FurnitureItem(
        id: 'cabinets',
        title: 'Cabinets',
        estimatedPrice: 0,
        category: FurnitureCategory.storage,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'countertop',
        title: 'Countertop',
        estimatedPrice: 0,
        category: FurnitureCategory.furniture,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'lighting',
        title: 'Lighting',
        estimatedPrice: 0,
        category: FurnitureCategory.lighting,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'storage_organizers',
        title: 'Storage Organizers',
        estimatedPrice: 0,
        category: FurnitureCategory.storage,
        status: FurnitureStatus.needed,
      ),
    ];
  }

  static List<FurnitureItem> get _bathroomItems {
    return const [
      FurnitureItem(
        id: 'mirror',
        title: 'Mirror',
        estimatedPrice: 0,
        category: FurnitureCategory.decor,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'storage_unit',
        title: 'Storage Unit',
        estimatedPrice: 0,
        category: FurnitureCategory.storage,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'lighting',
        title: 'Lighting',
        estimatedPrice: 0,
        category: FurnitureCategory.lighting,
        status: FurnitureStatus.needed,
      ),
      FurnitureItem(
        id: 'towels_rack',
        title: 'Towels Rack',
        estimatedPrice: 0,
        category: FurnitureCategory.other,
        status: FurnitureStatus.needed,
      ),
    ];
  }
}
