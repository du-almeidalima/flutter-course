import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopps/config.dart';
import 'package:shopps/providers/product.provider.dart';

class Products with ChangeNotifier {
  String _authToken;
  List<Product> _products = [];

  List<Product> get products {
    return [...this._products];
  }

  List<Product> get favorites {
    return this._products.where((p) => p.isFavorite).toList();
  }

  // Constructor
  Products(this._authToken, this._products);

  Product findById(String id) {
    return this._products.firstWhere((p) => p.id == id);
  }

  Future<void> fetch() async {
    try {
      final res = await http.get(getAuthURL(
        resource: 'products',
        token: this._authToken,
      ));
      final decodedRes = json.decode(res.body) as Map<String, dynamic>;
      final List<Product> fetchedProducts = [];

      if (decodedRes == null) {
        return;
      }

      decodedRes.forEach(
        (id, properties) {
          fetchedProducts.add(Product(
              id: id,
              title: properties['title'],
              description: properties['description'],
              imageUrl: properties['imageUrl'],
              price: properties['price'],
              isFavorite: properties['isFavorite']));
        },
      );

      this._products = fetchedProducts;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> add(Product product) async {
    try {
      final res = await http.post(
        getAuthURL(resource: 'products', token: this._authToken),
        body: json.encode({
          'title': product.title,
          'price': product.price,
          'imageUrl': product.imageUrl,
          'description': product.description,
          'isFavorite': product.isFavorite,
        }),
      );

      final newProduct = Product(
        id: json.decode(res.body)['name'],
        title: product.title,
        price: product.price,
        imageUrl: product.imageUrl,
        isFavorite: false,
        description: product.description,
      );

      this._products.add(newProduct);
      notifyListeners();
    } on HttpException catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> update(Product product) async {
    final index = this._products.indexWhere((p) => p.id == product.id);
    if (index >= 0) {
      await http.patch(
        getAuthURL(resource: 'products/${product.id}', token: this._authToken),
        body: json.encode({
          'title': product.title,
          'price': product.price,
          'imageUrl': product.imageUrl,
          'description': product.description,
        }),
      );

      this._products[index] = product;
      notifyListeners();
    }
  }

  Future<void> delete(String productId) async {
    // For some reason, DELETE requests doesn't throw errors
    await http
    .delete(
      getAuthURL(
        resource: 'products/$productId',
        token: this._authToken,
      ),
    )
    .then((res) {
      if (res.statusCode >= 400) {
        throw HttpException('Could not execute deletion');
      }
      this._products.removeWhere((p) => p.id == productId);
      notifyListeners();
    });
  }

  Future<void> favoriteProduct(String id) async {
    final product = this._products.firstWhere((p) => p.id == id);

    final res = await http.patch(
      getAuthURL(resource: 'products/$id', token: this._authToken),
      body: json.encode({
        'isFavorite': !product.isFavorite,
      }),
    );

    if (res.statusCode >= 400) {
      throw HttpException(res.reasonPhrase);
    }

    product.toggleFavorite();
    notifyListeners();
  }
}

/*
 * The API is now protected and it needs an token to grant us access to its
 * endpoints, but how can we take an token from Auth provider to this provider?
 *
 * Since this class, Products, is just a normal dart class, we can pass the
 * Auth provider through this constructor. But we need an way to do this AFTER
 * the Auth provider is built, and for that we can use
 * ChangeNotifierProxyProvider
 *
 * The ChangeNotifierProxyProvider will "inject" the Provider class passed to it
 * so we can use that into this provider.
 *
 * Check main.dart
 *
 * Also, the provider inside the ChangeNotifierProxyProvider kinda subscribe to
 * it, and that causes the provider to rebuilt after every "parent" provider
 * change. Fortunately, Flutter gives us the previous values so we can reuse it.
 */
