import 'package:biocode/core/functions/build_snack_bar.dart';
import 'package:biocode/core/routing/routes.dart';
import 'package:biocode/features/auth/ui/manager/signin_cubit/signin_cubit.dart';
import 'package:biocode/features/auth/ui/views/widgets/signin_view_body.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) async {
        if (state is SigninSuccessState) {
          final currentUser = FirebaseAuth.instance.currentUser!;
          final oldStudent =
              await BlocProvider.of<SigninCubit>(context).showUserIsOldOrNot();
              
          // Check if user logged in via Facebook (or other providers that don't require email verification)
          final isSocialLogin = currentUser.providerData
              .any((userInfo) => userInfo.providerId != 'password');

          if (!context.mounted) return;

          if (isSocialLogin || currentUser.emailVerified) {
            if (oldStudent == false) {
              GoRouter.of(context).pushReplacement(Routes.fillProfileView);
              successSnackBar(
                context: context,
                message: S.of(context).login_success,
              );
            } else if (oldStudent == true) {
              GoRouter.of(context).pushReplacement(Routes.homeView);
              successSnackBar(
                context: context,
                message: S.of(context).login_success,
              );
            }
          } else {
            errorSnackBar(
              context: context,
              message: S.of(context).otp_verification_error_message,
            );
          }
        }
        if (state is SigninFailureState) {
          errorSnackBar(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SigninLoadingState ? true : false,
          child: const SigninViewBody(),
        );
      },
    );
  }
}
