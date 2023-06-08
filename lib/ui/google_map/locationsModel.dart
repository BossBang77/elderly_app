import 'package:geolocator/geolocator.dart';

class Locations {
  double latitude;
  double longtitude;
  Locations({this.latitude = 0, this.longtitude = 0});

  Future<void> getCurrentUserLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.openLocationSettings();
      }
    } else if (permission == LocationPermission.deniedForever) {
      await Geolocator.openLocationSettings();
    }
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      latitude = position.latitude;
      longtitude = position.longitude;
    }).catchError((e) {
      print(e);
    });
  }
}
