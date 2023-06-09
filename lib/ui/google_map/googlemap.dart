import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_application/ui/base/loader/loader_screen.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/google_map/cubit/google_map_cubit.dart';
import 'package:health_application/ui/google_map/locationsModel.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../ui-extensions/color.dart';

double userLatiPick = 0;
double userLongtiPick = 0;

class GoogleMaps extends StatelessWidget {
  final String titleTxt;
  final String hintTxt;
  GoogleMaps({Key? key, this.titleTxt = '', this.hintTxt = ''})
      : super(key: key);

  Completer<GoogleMapController> _controller = Completer();
  double userLati = 0;
  double userLongti = 0;
  double storeLati = 0;
  double storeLongti = 0;
  String locationName = '';
  Locations _locations = Locations();
  void _onAddMarkerButtonPressed(
      LatLng latlang, BuildContext context, state) async {
    context
        .read<GoogleMapCubit>()
        .pickLocation(latlang.latitude, latlang.longitude);
  }

  void _currentLocation() async {
    final GoogleMapController controller = await _controller.future;
    try {
      await _locations.getCurrentUserLocation();
    } on Exception {}
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(_locations.latitude, _locations.longtitude),
        zoom: 15.0,
      ),
    ));
  }

  Widget buttonAccept(BuildContext context, state) {
    return ButtonGradient(
      btnName: "ยืนยันสถานที่นัดหมาย",
      onClick: () {
        context.read<GoogleMapCubit>().acceptLocation();
      },
    );
  }

  Widget build(BuildContext context) {
    context.read<GoogleMapCubit>().initialState();
    return Scaffold(
      appBar: appBar(
          images: 'assets/images/exit_icon.png',
          onBack: () {
            Navigator.of(context).pop();
          },
          title: titleTxt.isEmpty ? "เลือกสถานที่นัดหมาย" : titleTxt),
      body: BlocConsumer<GoogleMapCubit, GoogleMapState>(
        listener: (context, state) {
          if (state is AcceptPositionState) {
            userLatiPick = state.latitude;
            userLongtiPick = state.longitude;
            locationName = state.locationName;
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return initState(context, state);
        },
      ),
    );
  }

  Widget initState(BuildContext context, state) {
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
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 250.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: color.GreyBorder)),
            padding: EdgeInsets.only(
                bottom: 12.0.h, top: 12.h, left: 12.w, right: 12.w),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: textSubtitle16W500(
                        'สถานที่นัดหมาย',
                        ColorTheme().black87,
                      ),
                    ),
                    if (state is ShowGoogleMap) ...{
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: textButton2(state.title, ColorTheme().black87,
                            maxline: 2),
                      )
                    },
                    SizedBox(
                      height: 10.h,
                    ),
                    buttonAccept(context, state),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                )),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 2.1,
          left: MediaQuery.of(context).size.width * 0.8,
          child: Padding(
            padding: EdgeInsets.only(bottom: 100.0.h),
            child: InkWell(
              onTap: () {
                context.read<GoogleMapCubit>().initialState();
              },
              child: Image.asset(
                "assets/images/mylocation.png",
              ),
            ),
          ),
        ),
        if (state is LoadingMap) ...{Loader()}
      ],
    );
  }
}
