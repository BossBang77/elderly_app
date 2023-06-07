import 'package:health_application/ui/elderly/water_intake/model/daily_drinking.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_drinking_list.g.dart';

@JsonSerializable()
class DailyWaterListModel {
  const DailyWaterListModel({this.data = const <DailyWaterModel>[]});

  final List<DailyWaterModel> data;

  //convert from json
  factory DailyWaterListModel.fromJson(Map<String, dynamic> json) =>
      _$DailyWaterListModelFromJson(json);

  DailyWaterListModel copyWith({List<DailyWaterModel>? data}) =>
      DailyWaterListModel(data: data ?? this.data);

  List<Object?> get props => <Object>[data];
}
