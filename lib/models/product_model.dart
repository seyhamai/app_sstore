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
}