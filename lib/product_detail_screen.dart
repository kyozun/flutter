import 'package:app_flutter/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget{
  final Product product;
  ProductDetailScreen({required this.product}) {}
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name)
      ),
      body: Center(
        child: Text(product.description),
      )
    );}



}