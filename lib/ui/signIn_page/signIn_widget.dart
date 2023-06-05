import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/bloc/master_data_bloc.dart';
import 'package:health_application/ui/base/user_secure_storage.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/home_page/bloc/home_page_bloc.dart';
import 'package:health_application/ui/home_page/home_page.dart';
import 'package:health_application/ui/signIn_page/bloc/sign_in_bloc.dart';
import 'package:health_application/ui/signIn_page/forgot_password/forgot_password_page.dart';
import 'package:health_application/ui/signIn_page/forgot_password/reset_password_widget.dart';
import 'package:health_application/ui/signIn_page/forgot_password/vertify_otp.dart';
import 'package:health_application/ui/signIn_page/login/login_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (_) => SignInBloc()..add(Initial()),
      child: BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) async {
        if (state.signInStatus == SignInStatus.success) {
          var loginRes = state.loginRes;
          await UserSecureStorage().setAccessToken(loginRes.accessToken);
          await UserSecureStorage().setUserData(loginRes);
          context
              .read<HomePageBloc>()
              .add(ChangeMenu(menus: menuType.mainPage));
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePage()));
        } else if (state.signInStatus == SignInStatus.fail) {
          final bool acceptClose = await showDialog(
              context: context,
              builder: (BuildContext context) => ErrorAlertWidget(
                    title: 'เกิดข้อผิดพลาด',
                    subTitle:
                        "อีเมล หรือรหัสผ่านของคุณไม่ถูกต้อง\nกรุณากรอกใหม่อีกครั้ง",
                  )) as bool;

          if (acceptClose) {
            context.read<SignInBloc>().add(Initial());
          }
        }
      }, builder: (BuildContext context, SignInState state) {
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
      }),
    );
  }
}
