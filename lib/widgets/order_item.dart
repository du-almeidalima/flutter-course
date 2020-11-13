import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopps/providers/orders.provider.dart' as orderProvider;

class OrderItem extends StatefulWidget {
  final orderProvider.OrderItem orderItem;

  const OrderItem(this.orderItem);

  Widget buildExpandedContent() {
    return Container(
      // Choosing the minimul high for few items or for more items
      height: (min((20 * this.orderItem.items.length) + 50.0, 200)),
      child: ListView(
        children: this
            .orderItem
            .items
            .map((item) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.product.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: item.quantity.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: ' x ${item.product.price}',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('\$${this.widget.orderItem.total}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy, hh:mm')
                  .format(this.widget.orderItem.date),
            ),
            trailing: IconButton(
              icon: Icon(
                this._isExpanded ? Icons.expand_less : Icons.expand_more,
              ),
              onPressed: () {
                setState(() {
                  this._isExpanded = !this._isExpanded;
                });
              },
            ),
          ),
          if (this._isExpanded) widget.buildExpandedContent()
        ],
      ),
    );
  }
}
