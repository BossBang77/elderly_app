import 'package:json_annotation/json_annotation.dart';

part 'update_status_req.g.dart';

@JsonSerializable()
class UpdateStatusReq {
  const UpdateStatusReq({this.status = '', this.appointmentId = ''});

  final String appointmentId;
  final String status;
  Map<String, dynamic> toJson() => _$UpdateStatusReqToJson(this);
  //convert from json
  factory UpdateStatusReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateStatusReqFromJson(json);

  List<Object?> get props => <Object>[appointmentId, status];
}
