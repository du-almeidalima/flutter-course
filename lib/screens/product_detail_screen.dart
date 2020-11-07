import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/products.provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    // The listen parameter won't update this subscription when it changes
    // Useful for components that are not going to be rebuilt
    final product = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Container(
        child: Text(product.title),
      ),
    );
  }
}
