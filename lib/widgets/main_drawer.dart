import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/auth_provider.dart';
import 'package:shopps/screens/cart_screen.dart';
import 'package:shopps/screens/orders_screen.dart';
import 'package:shopps/screens/user_products_screen.dart';
import 'package:shopps/utils/CustomRoute.dart';

class MainDrawer extends StatelessWidget {
  ListTile buildListTile(IconData icon, String title, Function onTileTapped) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTileTapped,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: GestureDetector(
              child: const Text(
                'Shopps',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          buildListTile(Icons.home, 'Home', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          Divider(),
          buildListTile(Icons.shopping_cart, 'Shopping Cart', () {
            Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
            // Local Route Custom Transition Animation
            // Navigator.of(context).pushReplacement(CustomRoute(
            //   builder: (ctx) => OrdersScreen(),
            // ));
          }),
          Divider(),
          buildListTile(Icons.shopping_bag, 'Orders', () {
            Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
          }),
          Divider(),
          buildListTile(Icons.attach_money, 'Products', () {
            Navigator.of(context)
                .pushReplacementNamed(UserProductsScreen.routeName);
          }),
          Spacer(),
          buildListTile(Icons.exit_to_app, 'Logout', () {
            Provider.of<Auth>(context, listen: false).signOut();
            Navigator.of(context).pushReplacementNamed('/');
          })
        ],
      ),
    );
  }
}
