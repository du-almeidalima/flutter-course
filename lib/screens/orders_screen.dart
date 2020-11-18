import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/orders.provider.dart' show Orders;
import 'package:shopps/widgets/main_drawer.dart';
import 'package:shopps/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      // Allows us to track a Future state and do actions based on it
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // Future Done
          else {
            if (snapshot.error != null) {
              // ERROR HANDLING
              return Center(
                child: Text('An error has occurred!'),
              );
            } else {
              return Consumer<Orders>(
                builder: (context, ordersProvide, _) =>
                    ListView.builder(
                      itemCount: ordersProvide.orders.length,
                      itemBuilder: (ctx, i) =>
                          OrderItem(ordersProvide.orders[i]),
                    ),
              );
            }
          }
        },
      ),
      drawer: MainDrawer(),
    );
  }
}
