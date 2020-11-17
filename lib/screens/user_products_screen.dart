import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/products.provider.dart';
import 'package:shopps/screens/edit-product-screen.dart';
import 'package:shopps/widgets/main_drawer.dart';
import 'package:shopps/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  static const String routeName = '/user-products';

  // This method will aways return a Future
  Future<void> screenRefreshed(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetch();
  }

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => this.screenRefreshed(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productsProvider.products.length,
            itemBuilder: (ctx, i) =>
                UserProductItem(productsProvider.products[i]),
          ),
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
