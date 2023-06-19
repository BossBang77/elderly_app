import 'package:json_annotation/json_annotation.dart';

part 'create_emergency_model.g.dart';

@JsonSerializable()
class CreateEmergencyModel {
  const CreateEmergencyModel(
      {this.longitude = 0, this.latitude = 0, this.addressFull = ''});

  ///convert from json
  factory CreateEmergencyModel.fromJson(Map<String, dynamic> json) =>
      _$CreateEmergencyModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateEmergencyModelToJson(this);
  final String addressFull;
  final num latitude;
  final num longitude;

  CreateEmergencyModel get empty => CreateEmergencyModel();

  CreateEmergencyModelcopyWith(
          {num? latitude, num? longitude, String? addressFull}) =>
      CreateEmergencyModel(addressFull: addressFull ?? this.addressFull);

  List<Object?> get props => <Object>[latitude, latitude, addressFull];
}
