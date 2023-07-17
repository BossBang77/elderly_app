part of 'google_map_cubit.dart';

@immutable
abstract class GoogleMapState extends Equatable {
  const GoogleMapState();
  @override
  List<Object> get props => [];
}

class GoogleMapInitial extends GoogleMapState {
  const GoogleMapInitial();
}

class LoadingMap extends GoogleMapState {
  const LoadingMap();
}

class ShowGoogleMap extends GoogleMapState {
  final double latitude;
  final double longitude;
  final String apiKey;
  final Set<Marker> markers;
  final String title;
  final String locationSearch;
  final List<Prediction> predictionList;
  ShowGoogleMap(
      {this.latitude = 0,
      this.longitude = 0,
      this.apiKey = "",
      this.markers = const {},
      this.title = '',
      this.locationSearch = '',
      this.predictionList = const <Prediction>[]});
  @override
  List<Object> get props =>
      [latitude, longitude, title, locationSearch, predictionList];
}

class AcceptPositionState extends GoogleMapState {
  final double latitude;
  final double longitude;
  final String locationName;

  AcceptPositionState(
      {this.latitude = 0, this.longitude = 0, this.locationName = ''});
  @override
  List<Object> get props => [latitude, longitude, locationName];
}
