import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:health_application/ui/base/model/status_code.dart';
import 'package:http/http.dart' as http;

final String googleApiKey = 'AIzaSyALzfxW1mOAUlmGc9Kv4dP6btpdZ6rbLaQ';

class GoogleAPIService {
  Future<dynamic> fetchUrl(Uri uri, {Map<String, String>? headers}) async {
    try {
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == StatusCode.success) {
        print('success');
        // var res = jsonDecode(utf8.decode(response.bodyBytes));
        return jsonEncode(exampleAutoCompleteMap);
      } else {
        return jsonEncode(exampleAutoCompleteMap);
      }
    } catch (e) {
      print(e);
      return jsonEncode(exampleAutoCompleteMap);
    }
  }

  Future<LatLng> getLatLng(Prediction prediction) async {
    final geocoding = GoogleMapsGeocoding(apiKey: googleApiKey);
    final response = await geocoding.searchByPlaceId(prediction.placeId ?? '');
    if (response.results.isNotEmpty) {
      final detail = response.results[0];
      var location = detail.geometry.location;
      if (response.status == StatusCode.success) {
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

var exampleAutoCompleteMap = {
  "predictions": [
    {
      "description": "Paris, France",
      "matched_substrings": [
        {"length": 5, "offset": 0}
      ],
      "place_id": "ChIJD7fiBh9u5kcRYJSMaMOCCwQ",
      "reference": "ChIJD7fiBh9u5kcRYJSMaMOCCwQ",
      "structured_formatting": {
        "main_text": "Paris",
        "main_text_matched_substrings": [
          {"length": 5, "offset": 0}
        ],
        "secondary_text": "France",
      },
      "terms": [
        {"offset": 0, "value": "Paris"},
        {"offset": 7, "value": "France"},
      ],
      "types": ["locality", "political", "geocode"],
    },
    {
      "description": "Paris, TX, USA",
      "matched_substrings": [
        {"length": 5, "offset": 0}
      ],
      "place_id": "ChIJmysnFgZYSoYRSfPTL2YJuck",
      "reference": "ChIJmysnFgZYSoYRSfPTL2YJuck",
      "structured_formatting": {
        "main_text": "Paris",
        "main_text_matched_substrings": [
          {"length": 5, "offset": 0}
        ],
        "secondary_text": "TX, USA",
      },
      "terms": [
        {"offset": 0, "value": "Paris"},
        {"offset": 7, "value": "TX"},
        {"offset": 11, "value": "USA"},
      ],
      "types": ["locality", "political", "geocode"],
    },
    {
      "description": "Paris, TN, USA",
      "matched_substrings": [
        {"length": 5, "offset": 0}
      ],
      "place_id": "ChIJ4zHP-Sije4gRBDEsVxunOWg",
      "reference": "ChIJ4zHP-Sije4gRBDEsVxunOWg",
      "structured_formatting": {
        "main_text": "Paris",
        "main_text_matched_substrings": [
          {"length": 5, "offset": 0}
        ],
        "secondary_text": "TN, USA",
      },
      "terms": [
        {"offset": 0, "value": "Paris"},
        {"offset": 7, "value": "TN"},
        {"offset": 11, "value": "USA"},
      ],
      "types": ["locality", "political", "geocode"],
    },
    {
      "description": "Paris, Brant, ON, Canada",
      "matched_substrings": [
        {"length": 5, "offset": 0}
      ],
      "place_id": "ChIJsamfQbVtLIgR-X18G75Hyi0",
      "reference": "ChIJsamfQbVtLIgR-X18G75Hyi0",
      "structured_formatting": {
        "main_text": "Paris",
        "main_text_matched_substrings": [
          {"length": 5, "offset": 0}
        ],
        "secondary_text": "Brant, ON, Canada",
      },
      "terms": [
        {"offset": 0, "value": "Paris"},
        {"offset": 7, "value": "Brant"},
        {"offset": 14, "value": "ON"},
        {"offset": 18, "value": "Canada"},
      ],
      "types": ["neighborhood", "political", "geocode"],
    },
    {
      "description": "Paris, KY, USA",
      "matched_substrings": [
        {"length": 5, "offset": 0}
      ],
      "place_id": "ChIJsU7_xMfKQ4gReI89RJn0-RQ",
      "reference": "ChIJsU7_xMfKQ4gReI89RJn0-RQ",
      "structured_formatting": {
        "main_text": "Paris",
        "main_text_matched_substrings": [
          {"length": 5, "offset": 0}
        ],
        "secondary_text": "KY, USA",
      },
      "terms": [
        {"offset": 0, "value": "Paris"},
        {"offset": 7, "value": "KY"},
        {"offset": 11, "value": "USA"},
      ],
      "types": ["locality", "political", "geocode"],
    },
  ],
  "status": "OK",
};
