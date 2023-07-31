import 'package:json_annotation/json_annotation.dart';
part 'appointment_list_request.g.dart';

@JsonSerializable()
class AppointmentListRequest {
  const AppointmentListRequest(
      {this.limit = 0,
      this.offset = 0,
      this.elderlyProfileId,
      this.volunteerProfileId,
      this.includeStatus,
      this.excludeStatus,
      this.endDate,
      this.startDate});

  final int limit;
  final int offset;
  final String? elderlyProfileId;
  final String? volunteerProfileId;
  final String? includeStatus;
  final String? excludeStatus;
  final String? endDate;
  final String? startDate;

  factory AppointmentListRequest.fromJson(Map<String, dynamic> json) =>
      _$AppointmentListRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentListRequestToJson(this);

  List<Object?> get props => <Object>[limit, offset];
}
