import 'package:json_annotation/json_annotation.dart';

part 'master_data_detail.g.dart';

@JsonSerializable()
class MasterDataDetail {
  const MasterDataDetail(
      {this.categoryCode = '',
      this.keyName = '',
      this.categoryName = '',
      this.state = '',
      this.keyCode = ''});

  ///convert from json
  factory MasterDataDetail.fromJson(Map<String, dynamic> json) =>
      _$MasterDataDetailFromJson(json);
  Map<String, dynamic> toJson() => _$MasterDataDetailToJson(this);
  final String categoryName;
  final String categoryCode;
  final String keyName;
  final String keyCode;
  final String state;

  List<Object?> get props =>
      <Object>[categoryCode, categoryName, keyCode, keyName, state];
}
