import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shopps/config.dart';
import 'package:shopps/providers/cart.provider.dart';
import 'package:shopps/providers/product.provider.dart';

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
        'total': total,
        'date': timeStamp.toIso8601String(),
        'items': cartItems
            .map((item) => {
                  'id': item.id,
                  'quantity': item.quantity,
                  'product': {
                    'title': item.product.title,
                    'price': item.product.price,
                    'imageUrl': item.product.imageUrl,
                    'description': item.product.description,
                    'isFavorite': item.product.isFavorite,
                  }
                })
            .toList(),
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

  Future<void> fetch() async {
    final res = await http.get('$baseURL/orders.json');
    final decodedRes = json.decode(res.body) as Map<String, dynamic>;
    List<OrderItem> fetchedOrders = [];

    if(decodedRes == null) {
      return;
    }

    decodedRes.forEach((id, properties) {
      fetchedOrders.add(
        OrderItem(
          id: id,
          date: DateTime.parse(properties['date']),
          total: properties['total'],
          items: (properties['items'] as List<dynamic>)
              .map(
                (item) => CartItem(
                  id: item['id'],
                  quantity: item['quantity'],
                  product: Product(
                    id: item['product']['id'],
                    description: item['product']['description'],
                    title: item['product']['title'],
                    price: item['product']['price'],
                    imageUrl: item['product']['imageUrl'],
                    isFavorite: item['product']['isFavorite'],
                  ),
                ),
              )
              .toList(),
        ),
      );
    });

    this._orders = fetchedOrders.reversed.toList();
    notifyListeners();
  }
}
