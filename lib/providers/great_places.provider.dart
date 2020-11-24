import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:great_places/db/great-places.db.dart';
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

    GreatPlacesDB.insert({
      'id': place.id,
      'title': place.title,
      'image': place.image.path,
    });
  }

  Future<void> fetch() async {
    final result = await GreatPlacesDB.get();
    this._items = result
        .map((item) => Place(
              id: item['id'],
              title: item['title'],
              location: null,
              // Creating a File with the Image File
              image: File(item['image']),
            ))
        .toList();
    notifyListeners();
  }
}
