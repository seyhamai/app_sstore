
class CategoryModel {
  final int id;
  final String name;
  // final String? image;
  final String icon;

  CategoryModel({
    required this.id,
    required this.name,
    // this.image,
    required this.icon,
  });

  factory CategoryModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      // image: json['image'],
      icon: json['icon'] ?? 'category',
    );
  }
}
