import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/cubit/expired_cubit.dart';
import 'package:health_application/ui/base/token_expired/expired_dialog.dart';
import 'package:health_application/ui/signIn_page/signIn_widget.dart';

class TokenExpiredWidget extends StatelessWidget {
  const TokenExpiredWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TokenExpiredCubit, bool>(
      listener: (context, expired) {
        // TODO: implement listener
        if (expired) {
          showDialog(
              context: context,
              builder: (_) {
                return ExpiredDialog();
              }).then((click) {
            if (click) {
              context.read<TokenExpiredCubit>().isExpired(false);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SignInPage()));
            }
          });
        }
      },
      child: Container(),
    );
  }
}
