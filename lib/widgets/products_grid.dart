import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/product.provider.dart';
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
        return Container(
          // Creating the Product provider for each Product
          child: ChangeNotifierProvider.value(
            // If the state doesn't use context, we can use this syntax.
            // Also, this syntax is ideal for list/grid items, as it prevents
            // Bugs similar to list items without Keys
            value: productsList[i],
            // ProductItem will get its values via
            child: ProductItem(),
          ),
        );
      },
    );
  }
}

/*
 * In here we're using two ChangeNotifier classes the Products and the Product.
 * The Products Notifier will handle changes in the list as a whole,
 * the Product Notifier will handle changes in the product favorite proerty.
 * 
 * This is usefull when you want that each item of the list reacts to change,
 * not the list as a whole.
 * 
 * Notes to ChangeNotifierProvider constructor. When using a value that is being
 * instanciated, such as in the main.dart file, it's better to use the
 * ChangeNotifierProvider() constructor. However, for values that are already
 * instanciated, it's better to use the ChangeNotifierProvider.value() approach
 */
