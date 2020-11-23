import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/cart.provider.dart';
import 'package:shopps/providers/orders.provider.dart';
import 'package:shopps/widgets/cart_list_item.dart';
import 'package:shopps/widgets/main_drawer.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cart';

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);

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
                  OrderButton(cartProvider)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // The Column expand to the need of its children, an ListView, has an infinte
          // Height, so in order to prevent overflow we can wrap it into the Expanded,
          // Which gives the remaining available space
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (ctx, i) {
                final item = cartProvider.cartItems.values.toList()[i];
                return CartListItem(item);
              },
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}

// == ORDER BUTTON WIDGET ==
class OrderButton extends StatefulWidget {
  const OrderButton(this.cartProvider);

  final Cart cartProvider;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var isLoading = false;

  bool get _isCartEmpty {
    return widget.cartProvider.itemCount == 0;
  }

  void handleButtonPressed() async {
    setState(() {
      this.isLoading = true;
    });

    try {
      await Provider.of<Orders>(context, listen: false).addOrder(
        widget.cartProvider.cartItems.values.toList(),
        widget.cartProvider.totalAmount,
      );
      widget.cartProvider.clear();
    } on HttpException catch (_) {
      print('Something bad happened');
    } finally {
      setState(() {
        this.isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: !this._isCartEmpty
          ? () {
              this.handleButtonPressed();
            }
          : null,
      child: this.isLoading
          ? CircularProgressIndicator()
          : Text(
              'ORDER NOW!',
              style: TextStyle(
                color:
                    !_isCartEmpty ? Theme.of(context).accentColor : Colors.grey,
              ),
            ),
    );
  }
}
