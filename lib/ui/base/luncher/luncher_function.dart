import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Luncher {
  static Future<void> launchMapsUrl(double lat, double lon) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: '+' + phoneNumber,
    );
    try {
      var tel = await launchUrl(launchUri);
    } catch (e) {
      print('tel');
      print(e);
    }
  }
}
