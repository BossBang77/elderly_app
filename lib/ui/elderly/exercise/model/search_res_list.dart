import 'package:health_application/ui/elderly/exercise/model/search_res_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_res_list.g.dart';

@JsonSerializable()
class SearchResListModel {
  const SearchResListModel({this.data = const <SearchResModel>[]});

  ///convert from json
  factory SearchResListModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResListModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResListModelToJson(this);
  final List<SearchResModel> data;

  SearchResListModel copyWith({List<SearchResModel>? data}) =>
      SearchResListModel(data: data ?? this.data);

  List<Object?> get props => <Object>[data];
}
