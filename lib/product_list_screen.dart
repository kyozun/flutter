import 'package:app_flutter/product_detail_screen.dart';
import 'product_data.dart';
import 'package:flutter/material.dart';


class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return  Card.outlined(
            margin: EdgeInsets.all(9),
           child: ListTile(
             leading: Image.network(product.imageUrl, width: 200, height: 50, fit: BoxFit.cover),
             title: Text(product.name),
             subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
             isThreeLine: true,
             trailing: Icon(Icons.arrow_forward),
             onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product)));
             },

           ),

          );
        },
      ),
    );
  }
}
