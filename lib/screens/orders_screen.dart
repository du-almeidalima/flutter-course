import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/orders.provider.dart' show Orders;
import 'package:shopps/widgets/main_drawer.dart';
import 'package:shopps/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final ordersProvide = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: ordersProvide.orders.length,
        itemBuilder: (ctx, i) => OrderItem(ordersProvide.orders[i]),
      ),
      drawer: MainDrawer(),
    );
  }
}
