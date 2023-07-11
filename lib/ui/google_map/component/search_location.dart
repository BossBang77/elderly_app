import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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

class SearchLocation extends StatefulWidget {
  const SearchLocation({super.key, required this.state});
  final GoogleMapState state;

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  String location = "";
  List<Prediction> predictions = [];

  Future<void> placeAutoComplete(String query) async {
    Uri uri = Uri.https(
        "maps.googleapis.com",
        'maps/api/place/autocomplete/json',
        {"input": query, "key": googleApiKey});

    String? response = await GoogleAPIService().fetchUrl(uri);

    if (response != null) {
      // print(response);

      PlacesAutocompleteResponse result =
          PlacesAutocompleteResponse.fromJson(jsonDecode(response));
      if (result.predictions.isNotEmpty) {
        setState(() {
          predictions = result.predictions;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state is ShowGoogleMap) {
      return Positioned(
          child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        color: color.white,
        height: location.isEmpty ? 80 : null,
        child: Column(
          children: [
            Container(
              child: TextFieldWidget.enable(
                text: location,
                hintText: 'ค้นหาที่อยู่',
                maxLength: 100,
                prefix: true,
                imagePathPrefix: 'assets/images/search_icon.png',
                onChanged: (value) {
                  setState(() {
                    location = value;
                    placeAutoComplete(value);
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: predictions.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        var latlang = await GoogleAPIService()
                            .getLatLng(predictions[index]);
                        print(latlang);
                        context
                            .read<GoogleMapCubit>()
                            .pickLocation(latlang.latitude, latlang.longitude);
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
                                textBody2(predictions[index].description ?? '',
                                    color.black87, false),
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
  }
}
