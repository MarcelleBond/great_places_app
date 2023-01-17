import 'dart:io';

import 'package:flutter/foundation.dart';

import '../helpers/db_helper.dart';
import '../helpers/location_helper.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }
  
  Place findById(String id){
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> addPlace(
      {required String title,
      required File pickedImage,
      required PlaceLocation location}) async {
    final address = await LocationHelper.getPlaceAddress(
        lat: location.latitude, lng: location.longitude);
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: title,
      location: PlaceLocation(
          latitude: location.latitude,
          longitude: location.longitude,
          address: address),
      image: pickedImage,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert(
      "user_places",
      {
        "id": newPlace.id,
        "title": newPlace.title,
        "image": newPlace.image.path,
        "loc_lat": newPlace.location.latitude,
        "loc_lng": newPlace.location.longitude,
        "address": newPlace.location.address!,
      },
    );
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData("user_places");
    _items = dataList
        .map(
          (e) => Place(
            id: e["id"],
            title: e["title"],
            location: PlaceLocation(
              latitude: e["loc_lat"],
              longitude: e["loc_lng"],
              address: e["address"],
            ),
            image: File(e["image"]),
          ),
        )
        .toList();
    notifyListeners();
  }
}
