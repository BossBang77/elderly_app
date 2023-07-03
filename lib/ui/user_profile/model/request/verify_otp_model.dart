import 'package:json_annotation/json_annotation.dart';
part 'verify_otp_model.g.dart';

@JsonSerializable()
class VerifyOtpModel {
  const VerifyOtpModel(
      {this.code = '', this.mobileNumber = '', this.token = ''});
  //convert from json
  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpModelFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyOtpModelToJson(this);

  final String mobileNumber;

  final String token;

  final String code;

  VerifyOtpModel copyWith(
          {String? token, String? code, String? mobileNumber}) =>
      VerifyOtpModel(
          token: token ?? this.token,
          code: code ?? this.code,
          mobileNumber: mobileNumber ?? this.mobileNumber);

  List<Object?> get props => <Object>[token, code, mobileNumber];
}
