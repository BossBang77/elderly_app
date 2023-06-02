import 'package:health_application/ui/base/model/master_data_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'master_data.g.dart';

@JsonSerializable()
class MasterData {
  const MasterData({this.data = const <MasterDataDetail>[]});

  ///convert from json
  factory MasterData.fromJson(Map<String, dynamic> json) =>
      _$MasterDataFromJson(json);
  Map<String, dynamic> toJson() => _$MasterDataToJson(this);
  final List<MasterDataDetail> data;

  List<Object?> get props => <Object>[data];
}
