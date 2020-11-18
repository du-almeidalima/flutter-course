import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/orders.provider.dart' show Orders;
import 'package:shopps/widgets/main_drawer.dart';
import 'package:shopps/widgets/order_item.dart';

class OrdersScreen extends StatefulWidget {
  static const String routeName = '/orders';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
    this._isLoading = true;

    Provider.of<Orders>(context, listen: false).fetch().then((_) => {
          setState(() {
            this._isLoading = false;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    final ordersProvide = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: this._isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: ordersProvide.orders.length,
              itemBuilder: (ctx, i) => OrderItem(ordersProvide.orders[i]),
            ),
      drawer: MainDrawer(),
    );
  }
}
