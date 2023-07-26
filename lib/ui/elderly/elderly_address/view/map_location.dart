import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_application/ui/elderly/elderly_address/bloc/elderly_address_bloc.dart';
import 'package:health_application/ui/elderly/elderly_address/model/location_model.dart';
import 'package:health_application/ui/google_map/component/search_location.dart';
import 'package:health_application/ui/google_map/cubit/google_map_cubit.dart';
import 'package:health_application/ui/google_map/locationsModel.dart';
import 'package:health_application/ui/ui-extensions/loaddingScreen.dart';

class MapLocation extends StatefulWidget {
  MapLocation({
    super.key,
    this.enableSearch = true,
    required this.latLng,
  });

  final bool enableSearch;
  final LocationModel? latLng;

  @override
  State<MapLocation> createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  double userLati = 0;

  double userLongti = 0;

  double storeLati = 0;

  double storeLongti = 0;

  void _onAddMarkerButtonPressed(
      LatLng latlang, BuildContext context, state) async {
    context
        .read<GoogleMapCubit>()
        .pickLocation(latlang.latitude, latlang.longitude);
  }

  void _searchPicker(LatLng latLng) async {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: latLng,
        zoom: 15.0,
      ),
    ));
  }

  late GoogleMapController _controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleMapCubit, GoogleMapState>(
      builder: (context, GoogleMapState state) {
        return Stack(
          children: [
            (state is ShowGoogleMap)
                ? GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(state.latitude, state.longitude),
                      zoom: 15,
                    ),
                    tiltGesturesEnabled: false,
                    onTap: (latlang) {
                      _onAddMarkerButtonPressed(latlang, context, state);
                      context.read<ElderlyAddressBloc>().add(LocationChange(
                          location: LocationModel(
                              latitude: latlang.latitude,
                              longitude: latlang.longitude)));
                      _searchPicker(latlang);
                    },
                    mapType: MapType.normal,
                    markers: state.markers,
                    onMapCreated: (GoogleMapController controller) {
                      _controller = controller;
                    })
                : Container(),
            if (state is ShowGoogleMap)
              SearchLocation(
                valueChanged: (latlang) {
                  context.read<ElderlyAddressBloc>().add(LocationChange(
                      location: LocationModel(
                          latitude: latlang.latitude,
                          longitude: latlang.longitude)));
                  _searchPicker(LatLng(latlang.latitude, latlang.longitude));
                },
              ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2.1,
              left: MediaQuery.of(context).size.width * 0.8,
              child: Padding(
                padding: EdgeInsets.only(bottom: 100.0.h),
                child: InkWell(
                  onTap: () async {
                    context.read<GoogleMapCubit>().initialState();
                    Locations _locations = Locations();
                    await _locations.getCurrentUserLocation();
                    context.read<ElderlyAddressBloc>().add(LocationChange(
                        location: LocationModel(
                            latitude: _locations.latitude,
                            longitude: _locations.longtitude)));
                    _searchPicker(
                        LatLng(_locations.latitude, _locations.longtitude));
                  },
                  child: Image.asset(
                    "assets/images/mylocation.png",
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
