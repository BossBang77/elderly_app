import 'package:json_annotation/json_annotation.dart';

part 'update_status_emergency_model.g.dart';

@JsonSerializable()
class UpdateStatusEmergencyModel {
  const UpdateStatusEmergencyModel({this.id = '', this.status = ''});

  ///convert from json
  factory UpdateStatusEmergencyModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateStatusEmergencyModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateStatusEmergencyModelToJson(this);
  final String id;
  final String status;

  UpdateStatusEmergencyModel get empty => UpdateStatusEmergencyModel();

  UpdateStatusEmergencyModelcopyWith({String? id, String? status}) =>
      UpdateStatusEmergencyModel(
          id: id ?? this.id, status: status ?? this.status);

  List<Object?> get props => <Object>[status, id];
}
