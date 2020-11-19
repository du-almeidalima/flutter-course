import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/products.provider.dart';
import 'package:shopps/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool _showOnlyFavorites;

  const ProductsGrid(this._showOnlyFavorites);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    final productsList = this._showOnlyFavorites
        ? productsProvider.favorites
        : productsProvider.products;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: productsList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // Child is taller than it's wide
          childAspectRatio: 2 / 3,
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) {
        return Container(
          // Creating the Product provider for each Product
          child: ChangeNotifierProvider.value(
            // If the state doesn't use context, we can use this syntax.
            // Also, this syntax is ideal for list/grid items, as it prevents
            // Bugs similar to list items without Keys
            value: productsList[i],
            // ProductItem will get its values via
            child: ProductItem(
              favoriteProductHandler: (String productId) async{
                return productsProvider.favoriteProduct(productId);
              },
            ),
          ),
        );
      },
    );
  }
}

/*
 * In here we're using two ChangeNotifier classes the Products and the Product.
 * The Products Notifier will handle changes in the list as a whole,
 * the Product Notifier will handle changes in the product favorite property.
 * 
 * This is useful when you want that each item of the list reacts to change,
 * not the list as a whole.
 * 
 * Notes to ChangeNotifierProvider constructor. When using a value that is being
 * instantiated, such as in the main.dart file, it's better to use the
 * ChangeNotifierProvider() constructor. However, for values that are already
 * instantiated, it's better to use the ChangeNotifierProvider.value() approach
 */
