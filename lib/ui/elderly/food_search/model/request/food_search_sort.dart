import 'package:json_annotation/json_annotation.dart';

part 'food_search_sort.g.dart';

@JsonSerializable()
class FoodSearchSort {
  const FoodSearchSort({
    this.by = '',
    this.order = ''
  });
  final String by;
  final String order;

  factory FoodSearchSort.fromJson(Map<String, dynamic> json) =>
      _$FoodSearchSortFromJson(json);
  Map<String, dynamic> toJson() => _$FoodSearchSortToJson(this);

  List<Object?> get props => <Object>[
    by,
    order
  ];
}