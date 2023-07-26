import 'package:health_application/ui/base/model/sort_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_exercise_model.g.dart';

@JsonSerializable()
class SearchExerciseModel {
  const SearchExerciseModel(
      {this.burnCalorieMax = 0,
      this.burnCalorieMin = 0,
      this.keyword = '',
      this.limit = 30,
      this.offset = 0,
      this.sort = const SortModel(),
      this.type = const <String>[]});

  ///convert from json
  factory SearchExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchExerciseModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchExerciseModelToJson(this);
  final String keyword;
  final int burnCalorieMin;
  final int burnCalorieMax;
  @JsonKey(
    name: 'types',
  )
  final List<String> type;
  final int limit;
  final int offset;
  final SortModel sort;

  SearchExerciseModel copyWith(
          {String? keyword,
          int? burnCalorieMax,
          int? burnCalorieMin,
          List<String>? type,
          int? limit,
          int? offset,
          SortModel? sort}) =>
      SearchExerciseModel(
          keyword: keyword ?? this.keyword,
          burnCalorieMax: burnCalorieMax ?? this.burnCalorieMax,
          burnCalorieMin: burnCalorieMin ?? this.burnCalorieMin,
          type: type ?? this.type,
          limit: limit ?? this.limit,
          offset: offset ?? this.offset);

  List<Object?> get props => <Object>[
        keyword,
        burnCalorieMax,
        burnCalorieMin,
        type,
        limit,
        offset,
        sort
      ];

  SearchExerciseModel get empty => SearchExerciseModel();
}
