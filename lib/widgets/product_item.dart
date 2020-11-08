import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/product.provider.dart';
import 'package:shopps/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Reaching to parent to find a instance of Product that has a ChangeNotifier
    final product = Provider.of<Product>(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailScreen.routeName,
          arguments: product.id,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              onPressed: () {
                product.toggleFavorite();
              },
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
