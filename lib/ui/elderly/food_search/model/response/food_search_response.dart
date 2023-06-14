import 'package:health_application/ui/elderly/appointment/model/decodable.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_search_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_search_response.g.dart';

@JsonSerializable()
class FoodSearchResponse implements Decodable<FoodSearchResponse> {
  const FoodSearchResponse({this.data = const[]});

  final List<FoodSearchItem> data;

  factory FoodSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$FoodSearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FoodSearchResponseToJson(this);

  List<Object?> get props => <Object>[data];
  
  @override
  FoodSearchResponse decode(Map<String, dynamic> json) {
    return FoodSearchResponse.fromJson(json);
  }
}