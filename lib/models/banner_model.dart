class BannerModel {
  final int id;
  final String title;
  final String subtitle;
  final String? background;
  final String color;

  BannerModel({
    required this.id,
    required this.title,
    required this.subtitle,
    this.background,
    required this.color,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      background: json['background'],
      color: json['color'] ?? 'indigo',
    );
  }
}