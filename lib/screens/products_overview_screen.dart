import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/cart.provider.dart';
import 'package:shopps/providers/products.provider.dart';
import 'package:shopps/screens/cart_screen.dart';
import 'package:shopps/widgets/badge.dart';
import 'package:shopps/widgets/main_drawer.dart';
import 'package:shopps/widgets/products_grid.dart';

enum FilterOptions { FAVORITES, ALL_PRODUCTS }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFavorites = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    Provider.of<Products>(context, listen: false).fetch()
    .then((_) {
      setState(() {
        _isLoading = false;
      });
    }).catchError((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopps'),
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
          ),
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
        ],
      ),
      drawer: MainDrawer(),
      body: this._isLoading
          ? Center(child: CircularProgressIndicator())
          : ProductsGrid(this._showOnlyFavorites),
    );
  }
}
