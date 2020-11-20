import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopps/config.dart';
import 'package:shopps/providers/product.provider.dart';

import 'auth_provider.dart';

class Products with ChangeNotifier {
  Auth authProvider;
  List<Product> _products = [];

  List<Product> get products {
    return [...this._products];
  }

  List<Product> get favorites {
    return this._products.where((p) => p.isFavorite).toList();
  }

  // Constructor
  Products(this.authProvider, this._products) {
    print('Products Constructor');
  }

  Product findById(String id) {
    return this._products.firstWhere((p) => p.id == id);
  }

  Future<void> fetch([bool filterByUser = false]) async {
    print('Called');
    final filterParam = filterByUser
        ? '&orderBy="creatorId"&equalTo="${this.authProvider.userId}"'
        : '';
    http.Response prodRes;
    http.Response userFavRes;

    try {
      prodRes = await http.get(getAuthURL(
          resource: 'products',
          token: this.authProvider.token,
          params: filterParam));

      userFavRes = await http.get(getAuthURL(
        resource: 'userFavorites/${this.authProvider.userId}',
        token: this.authProvider.token,
      ));

      final decodedProdRes = json.decode(prodRes.body) as Map<String, dynamic>;
      final decodedUserFavRes = json.decode(userFavRes.body);
      final List<Product> fetchedProducts = [];

      if (decodedProdRes == null) {
        return;
      }

      decodedProdRes.forEach(
        (id, properties) {
          final isFavorite = decodedUserFavRes == null
              ? false
              : decodedUserFavRes[id] == null
                  ? false
                  : decodedUserFavRes[id]['isFavorite'] ?? false;

          fetchedProducts.add(Product(
            id: id,
            title: properties['title'],
            description: properties['description'],
            imageUrl: properties['imageUrl'],
            price: properties['price'],
            isFavorite: isFavorite,
          ));
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
        getAuthURL(resource: 'products', token: this.authProvider.token),
        body: json.encode({
          'title': product.title,
          'creatorId': this.authProvider.userId,
          'price': product.price,
          'imageUrl': product.imageUrl,
          'description': product.description,
        }),
      );

      final newProduct = Product(
        id: json.decode(res.body)['name'],
        title: product.title,
        price: product.price,
        imageUrl: product.imageUrl,
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
        getAuthURL(
            resource: 'products/${product.id}', token: this.authProvider.token),
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
        token: this.authProvider.token,
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

  Future<void> favoriteProduct(String productId) async {
    final product = this._products.firstWhere((p) => p.id == productId);

    final res = await http.patch(
      getAuthURL(
          resource: 'userFavorites/${this.authProvider.userId}/$productId',
          token: this.authProvider.token),
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
