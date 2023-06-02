import 'package:json_annotation/json_annotation.dart';
part 'sign_in_model.g.dart';

@JsonSerializable()
class SignInModel {
  const SignInModel({this.password = '', this.username = ''});
  //convert from json
  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignInModelToJson(this);

  final String username;
  final String password;

  SignInModel copyWith({String? password, String? username}) => SignInModel(
      password: password ?? this.password, username: username ?? this.username);

  List<Object?> get props => <Object>[username, password];
}
