class ProductModel {
  final int id;
  final String name;
  final String image;
  final double price;
  final double? oldPrice;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.oldPrice,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      price: double.tryParse(
            json['price'].toString(),
          ) ??
          0,
      oldPrice: json['old_price'] != null
          ? double.tryParse(
              json['old_price'].toString(),
            )
          : null,
    );
  }
}