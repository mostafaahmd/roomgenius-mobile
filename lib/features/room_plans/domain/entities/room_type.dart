enum RoomType {
  bedroom('bedroom', 'Bedroom'),
  livingRoom('living_room', 'Living Room'),
  office('office', 'Home Office'),
  kidsRoom('kids_room', 'Kids Room'),
  kitchen('kitchen', 'Kitchen'),
  bathroom('bathroom', 'Bathroom');

  const RoomType(this.value, this.fallbackLabel);

  final String value;
  final String fallbackLabel;

  static RoomType fromValue(String value) {
    return RoomType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => RoomType.bedroom, // Default to bedroom if no match is found
    );
  }
}
