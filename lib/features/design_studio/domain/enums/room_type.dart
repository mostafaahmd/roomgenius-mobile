enum RoomType {
  livingRoom,
  bedroom,
  kitchen,
  bathroom,
  diningRoom,
  homeOffice,
  nursery,
  patio,
  garage,
  other,
}

extension RoomTypeX on RoomType {
  String get value {
    switch (this) {
      case RoomType.livingRoom:
        return 'living_room';
      case RoomType.bedroom:
        return 'bedroom';
      case RoomType.kitchen:
        return 'kitchen';
      case RoomType.bathroom:
        return 'bathroom';
      case RoomType.diningRoom:
        return 'dining_room';
      case RoomType.homeOffice:
        return 'home_office';
      case RoomType.nursery:
        return 'nursery';
      case RoomType.patio:
        return 'patio';
      case RoomType.garage:
        return 'garage';
      case RoomType.other:
        return 'other';
    }
  }

  String get label {
    switch (this) {
      case RoomType.livingRoom:
        return 'Living Room';
      case RoomType.bedroom:
        return 'Bedroom';
      case RoomType.kitchen:
        return 'Kitchen';
      case RoomType.bathroom:
        return 'Bathroom';
      case RoomType.diningRoom:
        return 'Dining Room';
      case RoomType.homeOffice:
        return 'Home Office';
      case RoomType.nursery:
        return 'Nursery';
      case RoomType.patio:
        return 'Patio';
      case RoomType.garage:
        return 'Garage';
      case RoomType.other:
        return 'Other';
    }
  }

  String get promptLabel {
    switch (this) {
      case RoomType.livingRoom:
        return 'living room';
      case RoomType.bedroom:
        return 'bedroom';
      case RoomType.kitchen:
        return 'kitchen';
      case RoomType.bathroom:
        return 'bathroom';
      case RoomType.diningRoom:
        return 'dining room';
      case RoomType.homeOffice:
        return 'home office';
      case RoomType.nursery:
        return 'nursery';
      case RoomType.patio:
        return 'patio';
      case RoomType.garage:
        return 'garage';
      case RoomType.other:
        return 'interior space';
    }
  }

  String get arabicLabel {
    switch (this) {
      case RoomType.livingRoom:
        return 'غرفة معيشة';
      case RoomType.bedroom:
        return 'غرفة نوم';
      case RoomType.kitchen:
        return 'مطبخ';
      case RoomType.bathroom:
        return 'حمام';
      case RoomType.diningRoom:
        return 'غرفة طعام';
      case RoomType.homeOffice:
        return 'مكتب منزلي';
      case RoomType.nursery:
        return 'غرفة أطفال صغيرة';
      case RoomType.patio:
        return 'جلسة خارجية';
      case RoomType.garage:
        return 'جراج';
      case RoomType.other:
        return 'مساحة داخلية';
    }
  }

  static RoomType fromValue(String value) {
    return RoomType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => RoomType.other,
    );
  }
}
