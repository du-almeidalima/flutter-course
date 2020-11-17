import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopps/config.dart';
import 'package:shopps/providers/product.provider.dart';

class Products with ChangeNotifier {
  bool _isFavoriteFilter = false;
  List<Product> _products = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'A Very Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  List<Product> get products {
    return [...this._products];
  }

  List<Product> get favorites {
    return this._products.where((p) => p.isFavorite).toList();
  }

  Product findById(String id) {
    return this._products.firstWhere((p) => p.id == id);
  }

  Future<void> fetch() async {
    try {
      final res = await http.get('$baseURL/products.json');
      final decodedRes = json.decode(res.body) as Map<String, dynamic>;
      final List<Product> fetchedProducts = [];
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
        '$baseURL/products.json',
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
        '$baseURL/products/${product.id}.json',
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
    await http.delete('$baseURL/products/$productId').then((res) {
      if(res.statusCode >= 400) {
        throw HttpException('Could not execute deletion');
      }
      this._products.removeWhere((p) => p.id == productId);
      notifyListeners();
    });
  }

  void favoriteProduct(String id) {
    this._products.firstWhere((p) => p.id == id).toggleFavorite();
    notifyListeners();
  }
}
