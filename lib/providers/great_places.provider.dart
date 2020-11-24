import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:great_places/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [...this._items];
  }

  void add(String title, File image) {
    final place = Place(
      id: DateTime.now().toString(),
      title: title,
      location: null,
      image: image,
    );

    this._items.add(place);
    notifyListeners();
  }
}
