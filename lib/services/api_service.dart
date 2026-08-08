```dart
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/banner_model.dart';
import '../models/category_model.dart';

class ApiService {
  // Change this later to your Laravel API URL.
  static const String baseUrl =
      "http://localhost/your_laravel_project/api";

  // ============================================================
  // BANNERS
  // ============================================================

  Future<List<BannerModel>> getBanners() async {
    final response = await http.get(
      Uri.parse('$baseUrl/banners'),
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load banners',
      );
    }

    final data = jsonDecode(response.body);

    return (data['data'] as List)
        .map(
          (json) => BannerModel.fromJson(json),
        )
        .toList();
  }

  // ============================================================
  // CATEGORIES
  // ============================================================

  Future<List<CategoryModel>> getCategories() async {
    final response = await http.get(
      Uri.parse('$baseUrl/categories'),
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load categories',
      );
    }

    final data = jsonDecode(response.body);

    return (data['data'] as List)
        .map(
          (json) => CategoryModel.fromJson(json),
        )
        .toList();
  }
}
```
