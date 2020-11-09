import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/cart.provider.dart';
import 'package:shopps/widgets/badge.dart';
import 'package:shopps/widgets/products_grid.dart';

enum FilterOptions { FAVORITES, ALL_PRODUCTS }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopps'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOptions itemValue) {
              // Called whenver a PopupMenuItem is clicked
              setState(() {
                if (itemValue == FilterOptions.FAVORITES) {
                  this._showOnlyFavorites = true;
                } else {
                  this._showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: const Text('Favorites'),
                value: FilterOptions.FAVORITES,
              ),
              PopupMenuItem(
                child: const Text('All Products'),
                value: FilterOptions.ALL_PRODUCTS,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (ctx, cart, child) => Badge(
              child: child,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: ProductsGrid(this._showOnlyFavorites),
    );
  }
}
