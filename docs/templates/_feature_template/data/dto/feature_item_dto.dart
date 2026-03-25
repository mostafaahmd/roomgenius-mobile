class FeatureItemDto {
  const FeatureItemDto({
    required this.id,
    required this.title,
  });

  final String id;
  final String title;

  factory FeatureItemDto.fromJson(Map<String, dynamic> json) {
    return FeatureItemDto(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
    };
  }
}
