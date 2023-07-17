import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/google_map/cubit/google_map_cubit.dart';
import 'package:health_application/ui/google_map/google_api_service.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

class SearchLocation extends StatelessWidget {
  const SearchLocation({super.key, this.valueChanged = null});

  final ValueChanged<LatLng>? valueChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleMapCubit, GoogleMapState>(
        builder: (context, state) {
      if (state is ShowGoogleMap) {
        return Positioned(
            child: Container(
          padding: EdgeInsets.only(
              left: 20,
              right: state.locationSearch.isNotEmpty ? 5 : 20,
              top: 10),
          color: color.white,
          height: state.predictionList.isEmpty ? 80 : null,
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextFieldWidget.enable(
                        text: state.locationSearch,
                        hintText: 'ค้นหาที่อยู่',
                        maxLength: 100,
                        prefix: true,
                        imagePathPrefix: 'assets/images/search_icon.png',
                        textInputAction: TextInputAction.search,
                        onChanged: (value) {
                          context
                              .read<GoogleMapCubit>()
                              .onChangeSearchText(value);
                        },
                        onFieldSubmitted: () {
                          context
                              .read<GoogleMapCubit>()
                              .searchLocation(state.locationSearch);
                        },
                      ),
                    ),
                    if (state.locationSearch.isNotEmpty)
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.cancel,
                          color: color.greyText,
                        ),
                        onPressed: () {
                          context.read<GoogleMapCubit>().searchLocation('');
                        },
                      )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: state.predictionList.length,
                    itemBuilder: (context, index) {
                      var preList = state.predictionList[index];
                      return InkWell(
                        onTap: () async {
                          var latlang =
                              await GoogleAPIService().getLatLng(preList);
                          context.read<GoogleMapCubit>().pickLocation(
                              latlang.latitude, latlang.longitude,
                              searchValue: preList.description ?? '');

                          valueChanged?.call(
                              LatLng(latlang.latitude, latlang.longitude));
                        },
                        child: Container(
                          color: color.white.withOpacity(0.4),
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.location_on),
                                  SpaceWidget(
                                    width: 10,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: textBody2(preList.description ?? '',
                                        color.black87, false,
                                        maxLine: 2),
                                  ),
                                ],
                              ),
                              Divider()
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
      } else {
        return Container();
      }
    });
  }
}
