import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_application/ui/register_profile/model/addresses_detail.dart';

class Locations {
  double latitude;
  double longtitude;
  String nameAddress;
  Locations({this.latitude = 0, this.longtitude = 0, this.nameAddress = ''});

  Future<void> getCurrentUserLocation() async {
    try {
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
      var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      latitude = position.latitude;
      longtitude = position.longitude;
      nameAddress = await getAddress(LatLng(latitude, longtitude));
    } catch (e) {
      print(e);
    }
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

  Future<AddressDetailModel> getAddressDetailModel(LatLng latLng) async {
    AddressDetailModel address = AddressDetailModel();

    List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude, latLng.longitude,
        localeIdentifier: 'th');
    if (placemarks != null && placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      address = AddressDetailModel(
          addressNo: place.name ?? '',
          subDistrict: place.subLocality ?? '',
          district: place.subAdministrativeArea ?? '',
          postalCode: place.postalCode ?? '',
          country: place.country ?? '',
          province: place.administrativeArea ?? '',
          soi: place.name!.contains(place.thoroughfare ?? '')
              ? ''
              : place.thoroughfare ?? '',
          longitude: latLng.longitude,
          latitude: latLng.latitude);
    }
    return address;
  }
}
