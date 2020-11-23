import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/cart.provider.dart';
import 'package:shopps/providers/products.provider.dart';
import 'package:shopps/screens/cart_screen.dart';
import 'package:shopps/utils/GlobalScaffoldKey.dart';
import 'package:shopps/widgets/badge.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = '/product-detail';

  void _handleProductFavorite(BuildContext context, String productId) async {
    try {
      await Provider.of<Products>(context, listen: false)
          .favoriteProduct(productId);
    } on HttpException catch (_) {
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
    final productId = ModalRoute.of(context).settings.arguments as String;
    // The listen parameter won't update this subscription when it changes
    // Useful for components that are not going to be rebuilt
    final productsProvider = Provider.of<Products>(context);
    final cartProvider = Provider.of<Cart>(context);
    final product = productsProvider.findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
        actions: [
          Consumer<Cart>(
            builder: (ctx, cart, child) => Badge(
              child: child,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // The tag must match the previous Hero tag (product_item.dart)
              Hero(
                tag: product.id,
                child: Image.network(
                  product.imageUrl,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),
              SizedBox(height: 20),
              Text(
                product.title,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Text(
                product.description,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonBar(
        mainAxisSize: MainAxisSize.max,
        buttonHeight: 75,
        buttonMinWidth: (MediaQuery.of(context).size.width / 2),
        buttonPadding: EdgeInsets.zero,
        buttonTextTheme: ButtonTextTheme.accent,
        children: [
          FlatButton(
            onPressed: () {
              this._handleProductFavorite(context, productId);
            },
            child: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_outline,
              size: 45,
            ),
          ),
          FlatButton(
            onPressed: () {
              cartProvider.add(product);
            },
            child: Icon(
              Icons.shopping_cart,
              size: 45,
            ),
          ),
        ],
      ),
    );
  }
}
