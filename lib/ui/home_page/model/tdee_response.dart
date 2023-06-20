import 'package:health_application/ui/home_page/model/tdee_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tdee_response.g.dart';

@JsonSerializable()
class TDEEResponse {
  const TDEEResponse({
    this.data = const TDEEModel()
  });

  final TDEEModel data;

  List<Object?> get props => <Object>[data];

  factory TDEEResponse.fromJson(Map<String, dynamic> json) =>  _$TDEEResponseFromJson(json);
}