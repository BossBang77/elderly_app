import 'package:health_application/ui/elderly/search_volunteer/model/avaliable_time/avaliable_time_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'avaliable_data.g.dart';

@JsonSerializable()
class AvaliableData {
  const AvaliableData({this.data = const <AvaliableTimeDetail>[]});

  final List<AvaliableTimeDetail> data;

  //convert from json
  factory AvaliableData.fromJson(Map<String, dynamic> json) =>
      _$AvaliableDataFromJson(json);

  List<Object?> get props => <Object>[data];
}
