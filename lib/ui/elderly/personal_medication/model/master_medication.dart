import 'package:json_annotation/json_annotation.dart';

part 'master_medication.g.dart';

@JsonSerializable()
class MasterMedicationModel {
  const MasterMedicationModel(
      {this.code = '',
      this.commonName = '',
      this.description = '',
      this.id = '',
      this.name = '',
      this.type = ''});

  ///convert from json
  factory MasterMedicationModel.fromJson(Map<String, dynamic> json) =>
      _$MasterMedicationModelFromJson(json);
  Map<String, dynamic> toJson() => _$MasterMedicationModelToJson(this);
  final String id;
  final String code;
  final String name;
  final String commonName;
  final String description;
  final String type;

  MasterMedicationModel get empty => MasterMedicationModel();

  MasterMedicationModelcopyWith(
          {String? id,
          String? code,
          String? name,
          String? commonName,
          String? description,
          String? type}) =>
      MasterMedicationModel(
          id: id ?? this.id,
          code: code ?? this.code,
          name: name ?? this.name,
          commonName: commonName ?? this.commonName,
          description: description ?? this.description,
          type: type ?? this.type);

  List<Object?> get props =>
      <Object>[id, code, description, commonName, description, type];
}
