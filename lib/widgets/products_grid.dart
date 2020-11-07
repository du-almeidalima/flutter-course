import 'package:flutter/material.dart';
import 'package:shopps/models/product.model.dart';
import 'package:shopps/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid(this.productsList);

  final List<Product> productsList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: this.productsList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // Child is taller than it's wide
          childAspectRatio: 2 / 3,
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) {
        final product = this.productsList[i];

        return Container(
          child: ProductItem(
            id: product.id,
            title: product.title,
            imgUrl: product.imageUrl,
          ),
        );
      },
    );
  }
}
