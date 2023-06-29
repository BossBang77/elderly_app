import 'package:health_application/ui/elderly/personal_medication/model/master_medication.dart';
import 'package:json_annotation/json_annotation.dart';

part 'master_medication_list.g.dart';

@JsonSerializable()
class MasterMedicationListModel {
  const MasterMedicationListModel({
    this.data = const <MasterMedicationModel>[],
  });

  ///convert from json
  factory MasterMedicationListModel.fromJson(Map<String, dynamic> json) =>
      _$MasterMedicationListModelFromJson(json);
  Map<String, dynamic> toJson() => _$MasterMedicationListModelToJson(this);
  final List<MasterMedicationModel> data;

  MasterMedicationListModel get empty => MasterMedicationListModel();

  MasterMedicationListModelcopyWith({List<MasterMedicationModel>? data}) =>
      MasterMedicationListModel(data: data ?? this.data);

  List<Object?> get props => <Object>[data];
}
