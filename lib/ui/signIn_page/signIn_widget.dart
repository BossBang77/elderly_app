import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: BlocConsumer<SignInBloc, SignInState>(listener: (context, state) {
        // if (state.loading == Loading.loading) {
        //   context.read<LoadingIndicatorBloc>().add(ShowLoadingEvent());
        // } else {
        //   context.read<LoadingIndicatorBloc>().add(HideLoadingEvent());
        // }
      }, builder: (BuildContext context, SignInState state) {
        if (state.view == SectionView.login) {
          return LoginPage();
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
