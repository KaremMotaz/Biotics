import 'package:biocode/core/helpers/build_error_bar.dart';
import 'package:biocode/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:biocode/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          GoRouter.of(context).pop();
        }
        if (state is SignupFailureState) {
          showBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoadingState ? true : false,
          child: SignupViewBody(),
        );
      },
    );
  }
}
