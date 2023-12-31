import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/bloc/master_data_bloc.dart';
import 'package:health_application/ui/base/dialog/success_dialog.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/base/user_secure_storage.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/home_page/bloc/home_page_bloc.dart';
import 'package:health_application/ui/home_page/home_page.dart';
import 'package:health_application/ui/signIn_page/bloc/sign_in_bloc.dart';
import 'package:health_application/ui/signIn_page/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:health_application/ui/signIn_page/forgot_password/forgot_password_page.dart';
import 'package:health_application/ui/signIn_page/forgot_password/reset_password_widget.dart';
import 'package:health_application/ui/signIn_page/forgot_password/vertify_otp.dart';
import 'package:health_application/ui/signIn_page/login/login_page.dart';
import 'package:health_application/ui/ui-extensions/loaddingScreen.dart';
import 'package:health_application/ui/user_profile/bloc/user_profile_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignInBloc()..add(Initial())),
        BlocProvider(create: (context) => ForgotPasswordBloc()),
      ],
      child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
        listener: (context, forgotState) async {
          if (forgotState.requestResetStatus ==
              RequestResetPassword.requestSuccess) {
            context
                .read<SignInBloc>()
                .add(ChangeSection(view: SectionView.vertifyOTP));
            context.read<ForgotPasswordBloc>().add(RequestResetStatus());
          }

          if (forgotState.requestResetStatus ==
              RequestResetPassword.requestFail) {
            final bool acceptClose = await showDialog(
                context: context,
                builder: (BuildContext context) => ErrorAlertWidget(
                      title: 'เกิดข้อผิดพลาด',
                      subTitle: "มีบางอย่างผิดพลาด\nกรุณาลองใหม่อีกครั้ง",
                      btnName: 'ตกลง',
                    )) as bool;

            if (acceptClose) {
              context.read<ForgotPasswordBloc>().add(RequestResetStatus());
            }
          }

          if (forgotState.verifyStatus == VerifyStatus.success) {
            context
                .read<SignInBloc>()
                .add(ChangeSection(view: SectionView.resetPassword));
          }

          if (forgotState.submitResetPasswordStatus ==
              SubmitResetPasswordStatus.success) {
            showDialog(
                context: context,
                builder: (BuildContext _) => SuccessDialog(
                      header: "สำเร็จ!",
                      subtitle: "ตั้งค่ารหัสผ่านสำเร็จแล้ว",
                      buttonName: 'เข้าสู่ระบบ',
                      onTap: () {
                        Navigator.pop(context, true);
                        context
                            .read<SignInBloc>()
                            .add(ChangeSection(view: SectionView.login));
                      },
                    ));
          }

          if (forgotState.submitResetPasswordStatus ==
              SubmitResetPasswordStatus.fail) {
            final bool acceptClose = await showDialog(
                context: context,
                builder: (BuildContext context) => ErrorAlertWidget(
                      title: 'เกิดข้อผิดพลาด',
                      subTitle: "มีบางอย่างผิดพลาด\nกรุณาลองใหม่อีกครั้ง",
                      btnName: 'ตกลง',
                    )) as bool;

            if (acceptClose) {
              context.read<ForgotPasswordBloc>().add(ResetSubmitStatus());
            }
          }
        },
        builder: (context, forgotState) {
          return Stack(
            children: [signInPage(), if (forgotState.isLoading) Loader()],
          );
        },
      ),
    );
  }

  Widget signInPage() {
    return BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) async {
      if (state.signInStatus == SignInStatus.success) {
        var loginRes = state.loginRes;
        await UserSecureStorage().setAccessToken(loginRes.accessToken);
        await UserSecureStorage().setRefreshToken(loginRes.refreshToken);

        await UserSecureStorage().setUserData(loginRes);
        context.read<UserProfileBloc>()..add(GetUserProfile());
        context.read<HomePageBloc>().add(Initstate());
        context.read<HomePageBloc>().add(ChangeMenu(menus: menuType.mainPage));
        context.go(Routes.home);
      } else if (state.signInStatus == SignInStatus.loginFail) {
        final bool acceptClose = await showDialog(
            context: context,
            builder: (BuildContext context) => ErrorAlertWidget(
                  title: 'ไม่สำเร็จ!',
                  subTitle: "ล็อกอินไม่สำเร็จ\nกรุณาลองใหม่อีกครั้ง",
                  btnName: 'เข้าสู่ระบบ',
                )) as bool;

        if (acceptClose) {
          context.read<SignInBloc>().add(Initial());
        }
      }
    }, builder: (BuildContext context, SignInState state) {
      Widget getView() {
        if (state.view == SectionView.login) {
          return LoginPage(
            state: state,
          );
        } else if (state.view == SectionView.forgotPassword) {
          return ForgotPasswordPage();
        } else if (state.view == SectionView.vertifyOTP) {
          return VertifyOTPWidget();
        } else if (state.view == SectionView.resetPassword) {
          return ResetPasswordWidget();
        } else {
          return Container();
        }
      }

      return Stack(
        children: [getView(), if (state.isLoading) Loader()],
      );
    });
  }
}
