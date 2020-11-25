import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:great_places/db/great-places.db.dart';
import 'package:great_places/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [...this._items];
  }

  void add(String title, File image, PlaceLocation placeLocation) {
    final place = Place(
      id: DateTime.now().toString(),
      title: title,
      location: placeLocation,
      image: image,
    );

    this._items.add(place);
    notifyListeners();

    GreatPlacesDB.insert({
      'id': place.id,
      'title': place.title,
      'image': place.image.path,
      'loc_lat': place.location.latitude,
      'loc_lng': place.location.longitude,
    });
  }

  Future<void> fetch() async {
    final result = await GreatPlacesDB.get();
    this._items = result
        .map((item) => Place(
              id: item['id'],
              title: item['title'],
              // Creating a File with the Image File
              image: File(item['image']),
              location: PlaceLocation(
                latitude: item['loc_lat'],
                longitude: item['loc_lng'],
              ),
            ))
        .toList();
    notifyListeners();
  }
}
