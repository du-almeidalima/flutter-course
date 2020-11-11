import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopps/providers/orders.provider.dart' as orderProvider;

class OrderItem extends StatelessWidget {
  final orderProvider.OrderItem orderItem;

  const OrderItem(this.orderItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('\$${this.orderItem.total}'),
            subtitle: Text(
              DateFormat('dd MM yyyy, hh:mm').format(this.orderItem.date),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
