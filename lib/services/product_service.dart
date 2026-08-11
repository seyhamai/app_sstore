import '../api/api_client.dart';
import '../api/api_endpoints.dart';
import '../models/product_model.dart';

class ProductService {
  final ApiClient apiClient;

  ProductService({
    required this.apiClient,
  });

  Future<List<ProductModel>> getProducts() async {
    final data = await apiClient.get(
      ApiEndpoints.products,
    );

    return (data as List)
        .map(
          (json) => ProductModel.fromJson(json),
        )
        .toList();
  }
}