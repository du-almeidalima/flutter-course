import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/product.provider.dart';
import 'package:shopps/providers/products.provider.dart';
import 'package:shopps/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This allows to 'subscribe' to a provider class
    final List<Product> products = Provider.of<Products>(context).products;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopps'),
      ),
      body: ProductsGrid(products),
    );
  }
}
