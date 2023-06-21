import 'package:health_application/ui/volunteer/request_assistance_detail/model/assitance_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'request_assitance_list.g.dart';

@JsonSerializable()
class RequestAssitanceListModel {
  const RequestAssitanceListModel({this.data = const <AssitanceDetailModel>[]});

  ///convert from json
  factory RequestAssitanceListModel.fromJson(Map<String, dynamic> json) =>
      _$RequestAssitanceListModelFromJson(json);
  Map<String, dynamic> toJson() => _$RequestAssitanceListModelToJson(this);
  final List<AssitanceDetailModel> data;

  RequestAssitanceListModel get empty => RequestAssitanceListModel();

  RequestAssitanceListModel copyWith({List<AssitanceDetailModel>? data}) =>
      RequestAssitanceListModel(data: data ?? this.data);

  List<Object?> get props => <Object>[data];
}
