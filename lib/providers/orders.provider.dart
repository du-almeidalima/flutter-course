import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shopps/config.dart';
import 'package:shopps/providers/cart.provider.dart';

class OrderItem {
  final String id;
  final List<CartItem> items;
  final DateTime date;
  final double total;

  OrderItem({
    @required this.id,
    @required this.items,
    @required this.date,
    @required this.total,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [...this._orders];
  }

  Future<void> addOrder(List<CartItem> cartItems, double total) async {
    final timeStamp = DateTime.now();
    final res = await http.post(
      '$baseURL/orders.json',
      body: json.encode({
        'amount': total,
        'date': timeStamp.toIso8601String(),
        'items': cartItems.map((item) => {
          'id': item.id,
          'quantity': item.quantity,
          'product': {
            'title': item.product.title,
            'price': item.product.price,
            'imageUrl': item.product.imageUrl,
            'description': item.product.description,
            'isFavorite': item.product.isFavorite,
          }
        }).toList(),
      }),
    );

    final order = OrderItem(
        id: json.decode(res.body)['name'],
        items: cartItems,
        date: timeStamp,
        total: total);

    this._orders.add(order);
    notifyListeners();
  }
}
