import 'package:json_annotation/json_annotation.dart';

import '../bloc/personal_medication_bloc.dart';

part 'period_time_model.g.dart';

@JsonSerializable()
class PeriodTimeModel {
  const PeriodTimeModel(
      {this.code = '',
      this.notificationEveryHour = 0,
      this.notificationTime = ''});

  ///convert from json
  factory PeriodTimeModel.fromJson(Map<String, dynamic> json) =>
      _$PeriodTimeModelFromJson(json);
  Map<String, dynamic> toJson() => _$PeriodTimeModelToJson(this);
  final String code;
  final String notificationTime;
  final int notificationEveryHour;
  String desPeriod() {
    return '${getTimeOfMedication(code)} ';
  }

  PeriodTimeModel get empty => PeriodTimeModel();

  PeriodTimeModelcopyWith(
          {String? code,
          String? notificationTime,
          int? notificationEveryHour}) =>
      PeriodTimeModel(
          code: code ?? this.code,
          notificationEveryHour:
              notificationEveryHour ?? this.notificationEveryHour,
          notificationTime: notificationTime ?? this.notificationTime);

  List<Object?> get props =>
      <Object>[notificationEveryHour, notificationTime, code];
}
