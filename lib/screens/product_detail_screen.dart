import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/cart.provider.dart';
import 'package:shopps/providers/products.provider.dart';
import 'package:shopps/screens/cart_screen.dart';
import 'package:shopps/utils/GlobalScaffoldKey.dart';
import 'package:shopps/widgets/badge.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = '/product-detail';

  final navBarExpandedHeight = 300.0;
  final navBarHeight = 50.0;

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ScrollController _scrollController;
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();

    this._scrollController = ScrollController()
      ..addListener(() {
        final isExpanded = this._scrollController.hasClients &&
            this._scrollController.offset <
                widget.navBarExpandedHeight - 2 * widget.navBarHeight;

        if (this._isExpanded != isExpanded) {
          setState(() {
            this._isExpanded = isExpanded;
          });
        }
      });
  }

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
      body: CustomScrollView(
        // We can attach controllers to a ScrollView to do custom event handling
        // In this case, I use it to control the isExpanded value
        controller: this._scrollController,
        // Slivers are scrollable areas of screen, parts you can scroll
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
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
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: AnimatedContainer(
                duration: Duration(milliseconds: 250),
                width: double.infinity,
                height: widget.navBarHeight,
                color: this._isExpanded ? Colors.black54 : Colors.transparent,
                child: Center(
                  child: Text(
                    product.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: this._isExpanded ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              background: Hero(
                tag: product.id,
                child: Image.network(
                  product.imageUrl,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 20),
              Text(
                product.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 800),
            ]),
          )
        ],
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
