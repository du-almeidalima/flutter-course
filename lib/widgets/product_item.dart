import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/product.provider.dart';
import 'package:shopps/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Reaching to parent to find a instance of Product that has a ChangeNotifier
    final product = Provider.of<Product>(context, listen: false);

    print('Product ${product.title} build');

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
            // Looking for this State Provider in parent
            leading: Consumer<Product>(
              // The child argument is a Widget, inside the Widget being wrapped
              // That don't change, so we can pass it via the "child" argument
              // from Consumer, and that would be passed to the builder function
              builder: (ctx, prod, child) => IconButton(
                icon: Icon(
                  prod.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                onPressed: () {
                  prod.toggleFavorite();
                },
              ),
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

/**
 * Suppose a Widget on has some part of it that can change. For example this
 * Widget, the Title, Id and Image don't change, but the favorite property
 * does. What we could is, in the overall Widget, we could still use the
 * Provider.of to get the data needed, but for the part that changes, we can use
 * the Consumer Widget. With this, only the changed part will re-build
 */
