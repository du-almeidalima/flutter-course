import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:shopps/config.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.price,
    this.isFavorite = false,
  });

  factory Product.empty() {
    return Product(
      id: null,
      title: '',
      description: '',
      imageUrl: '',
      price: null,
      isFavorite: false,
    );
  }

  Product copyWith({
    String id,
    String title,
    String description,
    String imageUrl,
    double price,
    bool isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Future<void> toggleFavorite() async {
    final res = await http.patch(
      '$baseURL/products/${this.id}.json',
      body: json.encode({
        'isFavorite': !this.isFavorite,
      }),
    );

    if (res.statusCode >= 400) {
      throw HttpException(res.reasonPhrase);
    }

    this.isFavorite = !this.isFavorite;
    this.notifyListeners();
  }
}
