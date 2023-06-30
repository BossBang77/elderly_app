part of 'change_password_bloc.dart';

class ChangePasswordState extends Equatable {
  const ChangePasswordState(
      {this.oldPassword = '',
      this.confirmPassword = '',
      this.newPassword = '',
      this.obscureConfirmPassword = true,
      this.obscureNewPassword = true,
      this.obscureOldPassword = true,
      this.status = ChangePasswordStatus.initial,
      this.isLoading = false});
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;
  final bool obscureOldPassword;
  final bool obscureNewPassword;
  final bool obscureConfirmPassword;
  final ChangePasswordStatus status;
  final bool isLoading;

  ChangePasswordState copyWith(
      {String? oldPassword,
      String? newPassword,
      String? confirmPassword,
      bool? obscureOldPassword,
      bool? obscureNewPassword,
      bool? obscureConfirmPassword,
      ChangePasswordStatus? status,
      bool? isLoading}) {
    return ChangePasswordState(
        oldPassword: oldPassword ?? this.oldPassword,
        newPassword: newPassword ?? this.newPassword,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        obscureConfirmPassword:
            obscureConfirmPassword ?? this.obscureConfirmPassword,
        obscureNewPassword: obscureNewPassword ?? this.obscureNewPassword,
        obscureOldPassword: obscureOldPassword ?? this.obscureOldPassword,
        status: status ?? this.status,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [
        oldPassword,
        newPassword,
        confirmPassword,
        obscureConfirmPassword,
        obscureNewPassword,
        obscureOldPassword,
        status,
        isLoading
      ];
}

class ChangePasswordInitial extends ChangePasswordState {}

enum ChangePasswordStatus { initial, changeSuccess, changeFail }
