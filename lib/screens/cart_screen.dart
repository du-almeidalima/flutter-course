import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/cart.provider.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cart';

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Carts'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Chip(
                    label: Text(
                        '\$ ${cartProvider.totalAmount.toStringAsFixed(2)}'),
                    backgroundColor: Colors.amberAccent,
                  ),
                  Spacer(),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'ORDER NOW!',
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
