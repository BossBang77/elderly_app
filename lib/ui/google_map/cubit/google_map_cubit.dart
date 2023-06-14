import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_application/ui/google_map/locationsModel.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';
import 'package:equatable/equatable.dart';
import 'dart:ui' as ui;

part 'google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  GoogleMapCubit() : super(GoogleMapInitial());
  Locations _locations = Locations();
  String apiKey = "";
  double userLatiPick = 0;
  double userLongtiPick = 0;
  String locationName = '';

  initialState() async {
    emit(GoogleMapInitial());
    emit(LoadingMap());
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/images/marker_icon.png', 100);

    apiKey = await rootBundle.loadString('assets/GoogleMapApiKey.text');
    print(apiKey);
    await _locations.getCurrentUserLocation();
    double userLati = _locations.latitude;
    double userLongti = _locations.longtitude;
    userLatiPick = userLati;
    userLongtiPick = userLongti;
    print(userLatiPick);

    Set<Marker> markers = {};
    locationName = _locations.nameAddress;
    markers.add(Marker(
      markerId: MarkerId("Home"),
      position: LatLng(userLatiPick, userLongtiPick),
      infoWindow: InfoWindow(
        title: _locations.nameAddress,
      ),
      icon: BitmapDescriptor.fromBytes(markerIcon),
    ));
    emit(ShowGoogleMap(
        latitude: userLatiPick,
        longitude: userLongtiPick,
        apiKey: apiKey,
        markers: markers,
        title: _locations.nameAddress));
  }

  Future<void> pickLocation(double latitude, double longitude) async {
    emit(LoadingMap());
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/images/marker_icon.png', 100);
    Set<Marker> markers = {};
    String title = await getAddress(LatLng(latitude, longitude));
    locationName = title;
    userLatiPick = latitude;
    userLongtiPick = longitude;

    markers.add(Marker(
      markerId: MarkerId("Home"),
      position: LatLng(latitude, longitude),
      infoWindow: InfoWindow(
        title: title,
      ),
      icon: BitmapDescriptor.fromBytes(markerIcon),
    ));
    emit(ShowGoogleMap(
        latitude: latitude,
        longitude: longitude,
        apiKey: apiKey,
        markers: markers,
        title: title));
  }

  Future<void> acceptLocation() async {
    emit(AcceptPositionState(
        latitude: userLatiPick,
        longitude: userLongtiPick,
        locationName: locationName));
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

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}
