import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:health_application/ui/base/model/status_code.dart';
import 'package:http/http.dart' as http;

final String googleApiKey = 'AIzaSyATPkbhcnzSCPvd37lbO8iuLzA3mIwpKbk';

class GoogleAPIService {
  Future<String?> fetchUrl(Uri uri, {Map<String, String>? headers}) async {
    try {
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == StatusCode.success) {
        String res = utf8.decode(response.bodyBytes);
        return res;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<LatLng> getLatLng(Prediction prediction) async {
    final geocoding = GoogleMapsGeocoding(apiKey: googleApiKey);
    final response = await geocoding.searchByPlaceId(prediction.placeId ?? '');
    if (response.results.isNotEmpty) {
      if (response.isOkay) {
        final detail = response.results[0];
        var location = detail.geometry.location;
        double latitude = location.lat;
        double longitude = location.lng;
        return LatLng(latitude, longitude);
      } else {
        return LatLng(0, 0);
      }
    }

    return LatLng(0, 0);
  }
}
