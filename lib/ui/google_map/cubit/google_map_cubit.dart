import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_application/ui/google_map/locationsModel.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';
import 'package:equatable/equatable.dart';
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
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/marker_icon.png",
    );
    apiKey = await rootBundle.loadString('assets/GoogleMapApiKey.text');
    await _locations.getCurrentUserLocation();
    double userLati = _locations.latitude;
    double userLongti = _locations.longtitude;
    userLatiPick = userLati;
    userLongtiPick = userLongti;

    Set<Marker> markers = {};
    String title = await getAddress(LatLng(userLatiPick, userLongtiPick));
    locationName = title;
    markers.add(Marker(
      markerId: MarkerId("Home"),
      position: LatLng(userLatiPick, userLongtiPick),
      infoWindow: InfoWindow(
        title: title,
      ),
      icon: markerbitmap,
    ));
    emit(ShowGoogleMap(
        latitude: userLatiPick,
        longitude: userLongtiPick,
        apiKey: apiKey,
        markers: markers,
        title: title));
  }

  Future<void> pickLocation(double latitude, double longitude) async {
    emit(LoadingMap());
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/marker_icon.png",
    );
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
      icon: markerbitmap,
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
