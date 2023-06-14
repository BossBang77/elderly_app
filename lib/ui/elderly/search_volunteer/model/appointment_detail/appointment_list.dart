import 'package:health_application/ui/elderly/search_volunteer/model/appointment_detail/appointment_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appointment_list.g.dart';

@JsonSerializable()
class AppointList {
  const AppointList({this.data = const <AppointmentDetail>[]});

  final List<AppointmentDetail> data;

  //convert from json
  factory AppointList.fromJson(Map<String, dynamic> json) =>
      _$AppointListFromJson(json);

  Map<String, dynamic> toJson() => _$AppointListToJson(this);

  List<Object?> get props => <Object>[data];
}
