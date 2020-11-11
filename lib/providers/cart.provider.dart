import 'package:flutter/foundation.dart';
import 'package:shopps/providers/product.provider.dart';

class CartItem {
  final String id;
  final Product product;
  final int quantity;

  CartItem({
    @required this.id,
    @required this.product,
    @required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItems {
    return {...this._cartItems};
  }

  int get itemCount {
    if (this._cartItems.isEmpty) {
      return 0;
    }

    return this._cartItems.entries.fold(0, (acc, cur) {
      return acc + this._cartItems[cur.key].quantity;
    });
  }

  double get totalAmount {
    if (this._cartItems.isEmpty) {
      return 0;
    }

    return this._cartItems.values.fold(0.0, (acc, cur) {
      return acc + (cur.quantity * cur.product.price);
    });
  }

  void add(Product product) {
    if (this._cartItems.containsKey(product.id)) {
      this._cartItems.update(
            product.id,
            (oldCartItem) => CartItem(
              id: oldCartItem.id,
              quantity: oldCartItem.quantity + 1,
              product: product,
            ),
          );
    } else {
      final cartId = '${DateTime.now()}_${product.id}';

      this._cartItems.putIfAbsent(
            product.id,
            () => CartItem(id: cartId, quantity: 1, product: product),
          );
    }
    notifyListeners();
  }

  void remove(String productId) {
    this._cartItems.remove(productId);
    notifyListeners();
  }
}
