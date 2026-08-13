
import 'package:sstore_app/models/banner_model.dart';
import 'package:sstore_app/models/category_model.dart';
import 'package:sstore_app/models/product_model.dart';

class FakeData {
  static final List<BannerModel> banners = [
    BannerModel(
      id: 1,
      title: "Summer Sale",
      subtitle: "Up to 50% OFF",
      background: "assets/images/banner1.jpg",
      color: "indigo",
    ),
    BannerModel(
      id: 2,
      title: "New Arrival",
      subtitle: "Latest Collection",
      background: null,
      color: "deepOrange",
    ),
    BannerModel(
      id: 3,
      title: "Free Shipping",
      subtitle: "Orders over \$50",
      background: null,
      color: "green",
    ),
  ];
  static List<CategoryModel> categories = [
    CategoryModel(
      id: 1,
      name: "All",
      icon: "grid",
    ),

    CategoryModel(
      id: 2,
      name: "Running",
      icon: "directions_run",
    ),

    CategoryModel(
      id: 3,
      name: "Sneakers",
      icon: "sports",
    ),

    CategoryModel(
      id: 4,
      name: "Football",
      icon: "sports_soccer",
    ),

    CategoryModel(
      id: 5,
      name: "Basketball",
      icon: "sports_basketball",
    ),

    CategoryModel(
      id: 6,
      name: "Casual",
      icon: "checkroom",
    ),

    CategoryModel(
      id: 7,
      name: "Sandals",
      icon: "flip_flop",
    ),
    CategoryModel(
      id: 8,
      name: "Boots",
      icon: "checkroom",
    ),
    CategoryModel(
      id: 9,
      name: "Slippers",
      icon: "flip_flop",
    ),
  ];
  static List<ProductModel> promotionProducts = [
  ProductModel(
    id: 1,
    name: "Running Shoes",
    image: "assets/images/banner1.jpg",
    price: 39.00,
    oldPrice: 59.00,
  ),

  ProductModel(
    id: 2,
    name: "Sport Shoes",
    image: "assets/images/shoe2.jpg",
    price: 49.00,
    oldPrice: 69.00,
  ),

  ProductModel(
    id: 3,
    name: "Smart Shoes",
    image: "assets/images/shoe3.jpg",
    price: 35.00,
    oldPrice: 50.00,
  ),
];

static List<ProductModel> popularProducts = [
  ProductModel(
    id: 4,
    name: "Nike Running",
    image: "assets/images/shoe4.jpg",
    price: 89.00,
    oldPrice: 110.00,
  ),

  ProductModel(
    id: 5,
    name: "Casual Shoes",
    image: "assets/images/shoe5.jpg",
    price: 55.00,
    oldPrice: 75.00,
  ),
];

static List<ProductModel> newProducts = [
  ProductModel(
    id: 6,
    name: "New Sneakers",
    image: "assets/images/shoe6.jpg",
    price: 65.00,
  ),

  ProductModel(
    id: 7,
    name: "New Sport Shoes",
    image: "assets/images/shoe7.jpg",
    price: 72.00,
  ),
];
 static final List<ProductModel> products = [
    ProductModel(
  id: 1,
  name: "Nike Air Max",
  image: "assets/images/shoe1.jpg",
  price: 59.99,
  oldPrice: 79.99,
  rating: 4.8,
  description:
      "Comfortable running shoes with a lightweight design "
      "and excellent cushioning for everyday use.",
  sizes: [
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
  ],
  colors: [
    "Black",
    "White",
    "Red",
  ],
),

    ProductModel(
      id: 2,
      name: "Adidas Runner",
      image: "assets/images/shoe2.jpg",
      price: 49.99,
      oldPrice: 69.99,
    ),

    ProductModel(
      id: 3,
      name: "Puma Sport",
      image: "assets/images/shoe3.jpg",
      price: 44.99,
      oldPrice: 64.99,
    ),

    ProductModel(
      id: 4,
      name: "New Balance 574",
      image: "assets/images/shoe4.jpg",
      price: 69.99,
      oldPrice: 89.99,
    ),

    ProductModel(
      id: 5,
      name: "Nike Revolution",
      image: "assets/images/shoe5.jpg",
      price: 39.99,
      oldPrice: 54.99,
    ),

    ProductModel(
      id: 6,
      name: "Adidas Ultraboost",
      image: "assets/images/shoe6.jpg",
      price: 89.99,
      oldPrice: 119.99,
    ),

    ProductModel(
      id: 7,
      name: "Puma Velocity",
      image: "assets/images/shoe7.jpg",
      price: 54.99,
      oldPrice: 74.99,
    ),

    ProductModel(
      id: 8,
      name: "Converse Classic",
      image: "assets/images/shoe8.jpg",
      price: 45.99,
      oldPrice: 59.99,
    ),

    ProductModel(
      id: 9,
      name: "Nike Court Vision",
      image: "assets/images/shoe9.jpg",
      price: 64.99,
      oldPrice: 84.99,
    ),

    ProductModel(
      id: 10,
      name: "Adidas Forum Low",
      image: "assets/images/shoe10.jpg",
      price: 74.99,
      oldPrice: 99.99,
    ),

    ProductModel(
      id: 11,
      name: "Vans Old Skool",
      image: "assets/images/shoe11.jpg",
      price: 49.99,
      oldPrice: 65.99,
    ),

    ProductModel(
      id: 12,
      name: "Reebok Classic",
      image: "assets/images/shoe12.jpg",
      price: 42.99,
      oldPrice: 59.99,
    ),
  ];

}