import 'package:flutter/foundation.dart';
import 'package:shopps/providers/cart.provider.dart';

class OrderItem {
  final String id;
  final List<CartItem> items;
  final DateTime date;
  final double total;

  OrderItem(
      {@required this.id,
      @required this.items,
      @required this.date,
      @required this.total});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [...this._orders];
  }

  void addOrder(List<CartItem> cartItems, double total) {
    final order = OrderItem(
      id: DateTime.now().toString(),
      items: cartItems,
      date: DateTime.now(),
      total: total
    );

    this._orders.add(order);
    notifyListeners();
  }
}
