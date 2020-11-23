import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopps/providers/orders.provider.dart' as orderProvider;

class OrderItem extends StatefulWidget {
  final orderProvider.OrderItem orderItem;

  const OrderItem(this.orderItem);

  Widget buildExpandedContent(bool isExpanded) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
      // Choosing the minimum high for few items or for more items
      height: isExpanded
          ? (min((20 * this.orderItem.items.length) + 50.0, 200))
          : 0,
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
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
      height: this._isExpanded
          ? (min((20 * widget.orderItem.items.length) + 150.0, 180))
          : 80,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('\$${widget.orderItem.total}'),
              subtitle: Text(
                DateFormat('dd/MM/yyyy, hh:mm').format(widget.orderItem.date),
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
            widget.buildExpandedContent(this._isExpanded)
          ],
        ),
      ),
    );
  }
}
