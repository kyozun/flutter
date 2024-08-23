import 'package:app_flutter/features/weather/data/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts();
  Future<Product> fetchProductDetails(int id);
}
