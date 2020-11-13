import 'package:flutter/material.dart';
import 'package:shopps/screens/cart_screen.dart';
import 'package:shopps/screens/orders_screen.dart';

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
          buildListTile(Icons.shopping_cart, 'Shopping Cart', () {
            Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
          }),
          Divider(),
          buildListTile(Icons.shopping_bag, 'Orders', () {
            Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
