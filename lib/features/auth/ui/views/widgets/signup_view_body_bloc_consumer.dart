import 'package:biocode/core/functions/build_snack_bar.dart';
import 'package:biocode/core/routing/routes.dart';
import 'package:biocode/features/auth/ui/manager/signup_cubit/signup_cubit.dart';
import 'package:biocode/features/auth/ui/views/widgets/signup_view_body.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          successSnackBar(
            context: context,
            message: S.of(context).signup_success,
          );
          GoRouter.of(context).pushReplacement(Routes.oTPVerificationView);
        }
        if (state is SignupFailureState) {
          errorSnackBar(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoadingState ? true : false,
          child: const SignupViewBody(),
        );
      },
    );
  }
}
