import 'package:biocode/core/services/get_it_service.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:biocode/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:biocode/features/auth/presentation/views/widgets/signin_view_body_bloc_consumer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => SigninCubit(
          getIt.get<AuthRepo>(),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Sign in",
              style: TextStyles.bold20.copyWith(
                color: Colors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: SigninViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
