import 'package:flutter/material.dart';
import 'package:shopps/models/product.model.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Container(
        child: Text('Hey!' + productId),
      ),
    );
  }
}
