import 'package:app_flutter/models/cart_item.dart';
import 'package:app_flutter/models/product.dart';
import 'package:app_flutter/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product(id: 1, name: 'Product 1', price: 29.99),
    Product(id: 2, name: 'Product 2', price: 19.99),
    Product(id: 3, name: 'Product 3', price: 39.99),
  ];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to cart screen
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (ctx, i) => ListTile(
          title: Text(products[i].name),
          subtitle: Text('\$${products[i].price}'),
          trailing: IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {
              final cartItem = CartItem(
                id: 0,
                productId: products[i].id,
                productName: products[i].name,
                price: products[i].price,
                quantity: 1,
              );
              cartProvider.addToCart(cartItem);
            },
          ),
        ),
      ),
    );
  }
}
