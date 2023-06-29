import 'package:health_application/ui/elderly/personal_medication/model/period_time_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../base/model/master_data_detail.dart';
import '../bloc/personal_medication_bloc.dart';

part 'medication_detail_model.g.dart';

@JsonSerializable()
class MedicationDetailModel {
  const MedicationDetailModel(
      {this.description = '',
      this.dosage = '',
      this.isNotificationEveryDay = false,
      this.medicationId = '',
      this.periodTimes = const <PeriodTimeModel>[],
      this.periodType = '',
      this.id = ''});

  ///convert from json
  factory MedicationDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MedicationDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$MedicationDetailModelToJson(this);
  final String id;
  final String periodType;
  final String medicationId;
  final String dosage;
  final String description;
  final bool isNotificationEveryDay;
  final List<PeriodTimeModel> periodTimes;

  String periodName() {
    return getNamePeriod(periodType);
  }

  MedicationDetailModel get empty => MedicationDetailModel();

  MedicationDetailModel copyWith(
          {String? id,
          String? periodType,
          String? medicationId,
          String? dosage,
          String? description,
          bool? isNotificationEveryDay,
          List<PeriodTimeModel>? periodTimes}) =>
      MedicationDetailModel(
          id: id ?? this.id,
          periodTimes: periodTimes ?? this.periodTimes,
          periodType: periodType ?? this.periodType,
          medicationId: medicationId ?? this.medicationId,
          dosage: dosage ?? this.dosage,
          description: description ?? this.description,
          isNotificationEveryDay:
              isNotificationEveryDay ?? this.isNotificationEveryDay);

  List<Object?> get props => <Object>[
        id,
        periodTimes,
        periodType,
        dosage,
        description,
        isNotificationEveryDay,
      ];
}
