import 'package:biocode/core/functions/build_snack_bar.dart';
import 'package:biocode/features/auth/ui/manager/signin_cubit/signin_cubit.dart';
import 'package:biocode/features/auth/ui/views/widgets/signin_view_body.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        // if (state is SigninSuccessState) {
        //   if (FirebaseAuth.instance.currentUser!.emailVerified &&
        //       firstTime == true) {
        //     GoRouter.of(context).pushReplacement(Routes.fillProfileView);
        //   } else if (FirebaseAuth.instance.currentUser!.emailVerified &&
        //       firstTime == false) {
        //     GoRouter.of(context).pushReplacement(Routes.homeView);
        //   } else {
        //     errorSnackBar(
        //       context: context,
        //       message: S.of(context).otp_verification_error_message,
        //     );
        //   }
        // }
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
