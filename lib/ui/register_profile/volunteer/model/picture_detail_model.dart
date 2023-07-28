import 'package:json_annotation/json_annotation.dart';
part 'picture_detail_model.g.dart';

@JsonSerializable()
class PictureDetailModel {
  const PictureDetailModel({this.imgPath = '', this.sized = 0});

  ///convert from json
  factory PictureDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PictureDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$PictureDetailModelToJson(this);

  final String imgPath;
  final double sized;

  PictureDetailModel copyWith({String? imgPath, double? sized}) =>
      PictureDetailModel(
          imgPath: imgPath ?? this.imgPath, sized: sized ?? this.sized);

  List<Object?> get props => <Object>[imgPath, sized];
}
