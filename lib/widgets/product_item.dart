import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/cart.provider.dart';
import 'package:shopps/providers/product.provider.dart';
import 'package:shopps/screens/product_detail_screen.dart';
import 'package:shopps/utils/GlobalScaffoldKey.dart';

typedef Future<void> AsyncProductHandlerFn(String productId);

class ProductItem extends StatelessWidget {
  final AsyncProductHandlerFn favoriteProductHandler;

  const ProductItem({this.favoriteProductHandler});
  
  void _handleProductFavorite(Product product) async {
    try {
      await this.favoriteProductHandler(product.id);
    } on HttpException catch(_) {
      GlobalScaffoldKey.instance.showGlobalSnackbar(
        SnackBar(
          content: Text("Item couldn't be updated"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Reaching to parent to find a instance of Product that has a ChangeNotifier
    final productProvider = Provider.of<Product>(context, listen: false);
    final cartProvider = Provider.of<Cart>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailScreen.routeName,
          arguments: productProvider.id,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Hero(
            // This tag will tell the new screen which image to expand
            tag: productProvider.id,
            child: FadeInImage(
              placeholder: AssetImage('assets/images/product-placeholder.png'),
              image: NetworkImage(
                productProvider.imageUrl,
              ),
              fit: BoxFit.cover,
            ),
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
                  this._handleProductFavorite(prod);
                },
              ),
            ),
            title: Text(
              productProvider.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                cartProvider.add(productProvider);
                // Get the nearest element that is controlling the screen, through the
                // Context
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Item successfuly added to cart.'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                    action: SnackBarAction(
                      label: 'UNDO',
                      textColor: Colors.black87,
                      onPressed: () {
                        cartProvider.removeOneItem(productProvider.id);
                      },
                    ),
                  ),
                );
              },
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

/*
 * AsyncProductHandlerFn: I needed to do this because the Product provider would
 * need to have the authToken if the updateFavorite logic was inside it. So I
 * created an wrapper for a function that comes from Products provider.
 */
