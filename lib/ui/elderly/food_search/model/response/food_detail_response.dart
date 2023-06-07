import 'package:health_application/ui/elderly/food_search/model/response/food_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_detail_response.g.dart';

@JsonSerializable()
class FoodDetailResponse {
  const FoodDetailResponse({
    this.data = const FoodDetail()
  });

  final FoodDetail data;

  List<Object?> get props => <Object>[data];

  factory FoodDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$FoodDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FoodDetailResponseToJson(this);
}