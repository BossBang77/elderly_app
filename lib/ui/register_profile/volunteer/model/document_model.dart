import 'package:health_application/ui/register_profile/volunteer/model/picture_detail_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'document_model.g.dart';

@JsonSerializable()
class DocumentModel {
  const DocumentModel(
      {this.IDCard = const PictureDetailModel(),
      this.IDCardCouple = const PictureDetailModel(),
      this.volunteerCard = const PictureDetailModel(),
      this.volunteerCardCouple = const PictureDetailModel()});

  ///convert from json
  factory DocumentModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentModelFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentModelToJson(this);

  final PictureDetailModel IDCardCouple;
  final PictureDetailModel IDCard;
  final PictureDetailModel volunteerCard;
  final PictureDetailModel volunteerCardCouple;

  DocumentModel copyWith(
          {PictureDetailModel? IDCardCouple,
          PictureDetailModel? IDCard,
          PictureDetailModel? volunteerCard,
          PictureDetailModel? volunteerCardCouple}) =>
      DocumentModel(
          IDCard: IDCard ?? this.IDCard,
          IDCardCouple: IDCardCouple ?? this.IDCardCouple,
          volunteerCard: volunteerCard ?? this.volunteerCard,
          volunteerCardCouple: volunteerCardCouple ?? this.volunteerCardCouple);

  List<Object?> get props =>
      <Object>[IDCard, IDCardCouple, volunteerCard, volunteerCardCouple];
}
