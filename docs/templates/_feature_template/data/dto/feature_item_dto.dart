class FeatureItemDto {
  factory FeatureItemDto.fromJson(Map<String, dynamic> json) {
    return FeatureItemDto(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );
  }
  const FeatureItemDto({
    required this.id,
    required this.title,
  });

  final String id;
  final String title;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
    };
  }
}
