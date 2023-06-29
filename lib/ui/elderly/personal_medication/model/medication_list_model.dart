import 'package:json_annotation/json_annotation.dart';

import 'medication_detail_model.dart';

part 'medication_list_model.g.dart';

@JsonSerializable()
class ListMedicationDetailModel {
  const ListMedicationDetailModel({
    this.data = const <MedicationDetailModel>[],
  });

  ///convert from json
  factory ListMedicationDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ListMedicationDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$ListMedicationDetailModelToJson(this);
  final List<MedicationDetailModel> data;

  ListMedicationDetailModel get empty => ListMedicationDetailModel();

  ListMedicationDetailModelcopyWith({List<MedicationDetailModel>? data}) =>
      ListMedicationDetailModel(data: data ?? this.data);

  List<Object?> get props => <Object>[data];
}
