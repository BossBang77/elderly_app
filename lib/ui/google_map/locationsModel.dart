import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Locations {
  double latitude;
  double longtitude;
  String nameAddress;
  Locations({this.latitude = 0, this.longtitude = 0, this.nameAddress = ''});

  Future<Locations> getCurrentUserLocation() async {
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
        .then((Position position) async {
      latitude = position.latitude;
      longtitude = position.longitude;
      nameAddress = await getAddress(LatLng(latitude, longtitude));
      return Locations(
          latitude: latitude, longtitude: longtitude, nameAddress: nameAddress);
    }).catchError((e) {
      print(e);
      return Locations();
    });
    return Locations();
  }

  Future<String> getAddress(LatLng latLng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude, latLng.longitude,
        localeIdentifier: 'th');
    if (placemarks != null && placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      String title =
          '${place.name ?? ''}  ${place.subLocality ?? ''} ${place.locality ?? ''} ${place.country ?? ''} ${place.postalCode ?? ''}';

      return title;
    }
    return '';
  }
}
