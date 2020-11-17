import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopps/config.dart';
import 'package:shopps/providers/product.provider.dart';
import 'package:http/http.dart' as http;

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

  void add(Product product) {
    http
        .post(
      '$baseURL/products.json',
      body: json.encode({
        'title': product.title,
        'price': product.price,
        'imageUrl': product.imageUrl,
        'description': product.description,
        'isFavorite': product.isFavorite,
      }),
    )
        .then(
      (res) {
        
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
      },
    );
  }

  void update(Product product) {
    final index = this._products.indexWhere((p) => p.id == product.id);
    if (index >= 0) {
      this._products[index] = product;
      notifyListeners();
    }
  }

  void delete(String productId) {
    this._products.removeWhere((p) => p.id == productId);
    notifyListeners();
  }

  void favoriteProduct(String id) {
    this._products.firstWhere((p) => p.id == id).toggleFavorite();
    notifyListeners();
  }
}
