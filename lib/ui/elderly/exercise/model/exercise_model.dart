import 'package:json_annotation/json_annotation.dart';

part 'exercise_model.g.dart';

@JsonSerializable()
class ExerciseModel {
  const ExerciseModel({this.name = '', this.code = ''});

  ///convert from json
  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseModelToJson(this);

  final String name;
  final String code;

  ExerciseModel get empty => ExerciseModel();

  ExerciseModel copyWith({String? name, String? code}) =>
      ExerciseModel(name: name ?? this.name, code: code ?? this.code);

  List<Object?> get props => <Object>[name, code];
}
