import 'package:app_flutter/features/weather/data/models/product.dart';
import 'package:app_flutter/features/weather/data/repositories/product_repository.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductRepository productRepository;
  final int productId;

  const ProductDetailsScreen({
    Key? key,
    required this.productRepository,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: FutureBuilder<Product>(
        future: productRepository.fetchProductDetails(productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Product not found'));
          }

          final product = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(product.thumbnail),
                const SizedBox(height: 16),
                Text(product.title, style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 8),
                Text('\$${product.price}', style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 16),
                Text(product.description),
              ],
            ),
          );
        },
      ),
    );
  }
}
