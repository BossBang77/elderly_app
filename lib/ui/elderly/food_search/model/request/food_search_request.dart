import 'package:health_application/ui/elderly/food_search/model/request/food_search_sort.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_search_request.g.dart';

@JsonSerializable()
class FoodSearchRequest {
  const FoodSearchRequest({
    this.keyword = '',
    this.calorieMin = 0,
    this.calorieMax = 0,
    this.allergicFoods = const[],
    this.limit = 0,
    this.offset = 0,
    this.sort = const FoodSearchSort()
  });
  final String keyword;
  final double calorieMin;
  final double calorieMax;
  final List<String> allergicFoods;
  final int limit;
  final int offset;
  final FoodSearchSort sort;

  factory FoodSearchRequest.fromJson(Map<String, dynamic> json) =>
      _$FoodSearchRequestFromJson(json);
  Map<String, dynamic> toJson() => _$FoodSearchRequestToJson(this);

  List<Object?> get props => <Object>[
    keyword,
    limit,
    offset,
    sort,
    calorieMax,
    calorieMin,
    allergicFoods
  ];
}