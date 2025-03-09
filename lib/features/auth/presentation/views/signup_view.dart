import 'package:biocode/core/services/get_it_service.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:biocode/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:biocode/features/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => SignupCubit(
          getIt.get<AuthRepo>(),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Sign up",
              style: TextStyles.bold20.copyWith(
                color: Colors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: SignupViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
