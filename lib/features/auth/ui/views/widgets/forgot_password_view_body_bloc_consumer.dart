import '../../../../../core/widgets/custom_progress_hud.dart';

import '../../../../../core/functions/build_snack_bar.dart';
import '../../manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'forgot_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordViewBodyBlocConsumer extends StatelessWidget {
  const ForgotPasswordViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccessState) {
          GoRouter.of(context).pop();
        }
        if (state is ForgotPasswordFailureState) {
          errorSnackBar(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is ForgotPasswordLoadingState ? true : false,
          child: const ForgotPasswordViewBody(),
        );
      },
    );
  }
}
