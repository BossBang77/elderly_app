import 'package:health_application/ui/base/model/sort_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_volunteer_model.g.dart';

@JsonSerializable()
class SearchVolunteerModel {
  const SearchVolunteerModel(
      {this.gender = '',
      this.keyword = '',
      this.limit = 30,
      this.maxAge = 0,
      this.maxExperience = 0,
      this.minAge = 0,
      this.minExperience = 0,
      this.offset = 0,
      this.ratings = const <int>[],
      this.sort = const SortModel()});

  final String keyword;
  final String gender;
  final int minExperience;
  final int maxExperience;
  final int minAge;
  final int maxAge;
  final List<int> ratings;
  final int limit;
  final int offset;
  final SortModel sort;

  //convert from json
  factory SearchVolunteerModel.fromJson(Map<String, dynamic> json) =>
      _$SearchVolunteerModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchVolunteerModelToJson(this);

  SearchVolunteerModel copyWith(
          {String? keyword,
          String? gender,
          int? maxExperience,
          int? minExperience,
          int? minAge,
          int? maxAge,
          int? limit,
          int? offset,
          SortModel? sort,
          List<int>? ratings}) =>
      SearchVolunteerModel(
          keyword: keyword ?? this.keyword,
          gender: gender ?? this.gender,
          maxAge: maxAge ?? this.maxAge,
          minAge: minAge ?? this.minAge,
          limit: limit ?? this.limit,
          offset: offset ?? this.offset,
          ratings: ratings ?? this.ratings,
          sort: sort ?? this.sort,
          maxExperience: maxExperience ?? this.maxExperience,
          minExperience: minExperience ?? this.minExperience);

  List<Object?> get props => <Object>[
        keyword,
        gender,
        maxAge,
        minAge,
        limit,
        sort,
        offset,
        maxExperience,
        minExperience,
        ratings
      ];
}
