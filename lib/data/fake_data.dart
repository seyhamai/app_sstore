import 'package:flutter/material.dart';
import 'package:sstore_app/models/banner_model.dart';
import 'package:sstore_app/models/category_model.dart';

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
  ];

}