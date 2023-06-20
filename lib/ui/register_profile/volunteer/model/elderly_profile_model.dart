import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/water_intake/model/water_intake_goal.dart';
import 'package:health_application/ui/register_profile/model/profile_register.dart';
import 'package:health_application/ui/register_profile/model/sub_menu_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'elderly_profile_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ElderlyProfileModel extends Equatable {
  const ElderlyProfileModel({
    this.profile = const ProfileRegisterModel(),
    this.congenitalDisease = const [],
    this.allergicFoods = const [],
    this.personalMedication = const [],
    this.drinkingWater = const WaterIntakeGoalModel(),
  });

  ///convert from json
  factory ElderlyProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ElderlyProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ElderlyProfileModelToJson(this);

  @JsonKey(name: 'profile')
  final ProfileRegisterModel profile;
  @JsonKey(name: 'congenitalDisease')
  final List<SubMenuModel> congenitalDisease;
  @JsonKey(name: 'allergicFoods')
  final List<SubMenuModel> allergicFoods;
  @JsonKey(name: 'personalMedication')
  final List<SubMenuModel> personalMedication;
  @JsonKey(name: 'drinkingWater')
  final WaterIntakeGoalModel drinkingWater;

  ElderlyProfileModel copyWith({
    ProfileRegisterModel? profile,
    List<SubMenuModel>? congenitalDisease,
    List<SubMenuModel>? allergicFoods,
    List<SubMenuModel>? personalMedication,
    WaterIntakeGoalModel? drinkingWater,
  }) =>
      ElderlyProfileModel(
        profile: profile ?? this.profile,
        congenitalDisease: congenitalDisease ?? this.congenitalDisease,
        allergicFoods: allergicFoods ?? this.allergicFoods,
        personalMedication: personalMedication ?? this.personalMedication,
        drinkingWater: drinkingWater ?? this.drinkingWater,
      );

  List<Object?> get props => <Object>[
        profile,
        congenitalDisease,
        allergicFoods,
        personalMedication,
        drinkingWater,
      ];
}
