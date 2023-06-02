import 'package:json_annotation/json_annotation.dart';

part 'status_code.g.dart';

class StatusCode {
  static int get success => 200;
  static int get failure => 500;
  static int get notFound => 400;
  static int get fileNotFound => 404;
  static int get unauthorized => 401;
}

class StatusCodeMessage {
  static String get success => '0000';
  static String get notAvailable => '7777';
  static String get noData => '4001';
  static String get invalidCredential => '4002';
  static String get amcWaitingApprove => '4003';
  static String get icLicenseFreeze => '4004';
  static String get serverError => '5002';
  static String get timeout => '4112';
  static String get invalidInput => '4003';
  static String get error => '3001';
  static String get requiredField => '4008';
}

@JsonSerializable()
class Status {
  const Status({this.code = '', this.message = '', this.timestamps = ''});

  ///convert from json
  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
  Map<String, dynamic> toJson() => _$StatusToJson(this);
  final String code;
  final String message;
  final String timestamps;

  Status copyWith({String? code, String? message, String? timestamps}) =>
      Status(
          code: code ?? this.code,
          message: message ?? this.message,
          timestamps: timestamps ?? this.timestamps);

  List<Object?> get props => <Object>[code, message, timestamps];
}
