import 'package:json_annotation/json_annotation.dart';

part 'volunteer_detail_search.g.dart';

@JsonSerializable()
class VolunteerDetailSearch {
  const VolunteerDetailSearch(
      {this.elderlyCareName = '',
      this.image = '',
      this.name = '',
      this.profileId = '',
      this.rating = 0});

  final String profileId;
  final String name;
  final String elderlyCareName;
  final String image;
  final num rating;

  //convert from json
  factory VolunteerDetailSearch.fromJson(Map<String, dynamic> json) =>
      _$VolunteerDetailSearchFromJson(json);

  VolunteerDetailSearch copyWith(
          {String? profileId,
          String? name,
          String? elderlyCareName,
          String? image,
          num? rating}) =>
      VolunteerDetailSearch(
          profileId: profileId ?? this.profileId,
          name: name ?? this.name,
          elderlyCareName: elderlyCareName ?? this.elderlyCareName,
          image: image ?? this.image,
          rating: rating ?? this.rating);

  List<Object?> get props =>
      <Object>[profileId, name, elderlyCareName, image, rating];
}
