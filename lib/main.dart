import 'package:app_flutter/features/weather/data/repositories/product_repository.dart';
import 'package:app_flutter/features/weather/data/repositories/product_repository_impl.dart';
import 'package:app_flutter/features/weather/presentation/pages/product_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ProductRepository productRepository = ProductRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductListScreen(productRepository: productRepository),
    );
  }
}
