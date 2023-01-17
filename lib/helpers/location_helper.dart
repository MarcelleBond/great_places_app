import 'dart:convert';

import 'package:http/http.dart' as http;

import '../secrets/google_api_keys.dart';

class LocationHelper {
  static String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    return "https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_MAPS_API_KEY";
  }

  static Future<String> getPlaceAddress({
    required double lat,
    required double lng,
  }) async {
    final response = await http.get(
      Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_MAPS_API_KEY",
      ),
    );
    return json.decode(response.body)["results"][0]["formatted_address"];
  }
}
