import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_application/ui/elderly/elderly_address/model/location_model.dart';
import 'package:health_application/ui/google_map/cubit/google_map_cubit.dart';
import 'package:health_application/ui/google_map/locationsModel.dart';

class MapLocation extends StatelessWidget {
  MapLocation({
    super.key,
    required this.onAccept,
    this.enableSearch = true,
    required this.latLng,
  });

  final Function(LocationModel) onAccept;
  final bool enableSearch;
  final LatLng? latLng;

  Completer<GoogleMapController> _controller = Completer();
  double userLati = 0;
  double userLongti = 0;
  double storeLati = 0;
  double storeLongti = 0;

  void _onAddMarkerButtonPressed(
      LatLng latlang, BuildContext context, state) async {
    context
        .read<GoogleMapCubit>()
        .pickLocation(latlang.latitude, latlang.longitude);
    context.read<GoogleMapCubit>().acceptLocation();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleMapCubit, GoogleMapState>(
      listener: (context, state) {
        if (state is AcceptPositionState) {
          LocationModel model = LocationModel(
              latitude: state.latitude,
              longitude: state.longitude,
              locationName: state.locationName);
          onAccept.call(model);
        }
      },
      builder: (context, GoogleMapState state) {
        return Stack(
          children: [
            (state is ShowGoogleMap)
                ? GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(state.latitude, state.longitude),
                      zoom: 15,
                    ),
                    compassEnabled: true,
                    tiltGesturesEnabled: false,
                    onTap: (latlang) {
                      _onAddMarkerButtonPressed(latlang, context, state);
                    },
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    mapType: MapType.normal,
                    markers: state.markers,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  )
                : Container(),
            (state is ShowGoogleMap)
                ? Padding(
                    padding: EdgeInsets.only(
                        bottom: 16.0.h, top: 16.h, left: 16.w, right: 16.w),
                    child: Align(
                        alignment: Alignment.topCenter,
                        //todo search
                        child: Container()),
                  )
                : Container(),
          ],
        );
      },
    );
  }
}
