import 'package:health_application/ui/elderly/search_volunteer/model/volunteer_detail_search.dart';
import 'package:json_annotation/json_annotation.dart';

part 'volunteer_detail_res.g.dart';

@JsonSerializable()
class VolunteerDetailRes {
  const VolunteerDetailRes({this.data = const <VolunteerDetailSearch>[]});

  final List<VolunteerDetailSearch> data;

  //convert from json
  factory VolunteerDetailRes.fromJson(Map<String, dynamic> json) =>
      _$VolunteerDetailResFromJson(json);

  VolunteerDetailRes copyWith({List<VolunteerDetailSearch>? data}) =>
      VolunteerDetailRes(data: data ?? this.data);

  List<Object?> get props => <Object>[data];
}
