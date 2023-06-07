import 'package:health_application/ui/elderly/food_search/model/request/food_search_sort.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_search_request.g.dart';

@JsonSerializable()
class FoodSearchRequest {
  const FoodSearchRequest({
    this.keyword = '',
    this.limit = 0,
    this.offset = 0,
    this.sort = const FoodSearchSort()
  });
  final String keyword;
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
    sort
  ];
}