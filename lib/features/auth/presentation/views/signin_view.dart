import 'package:biocode/core/services/get_it_service.dart';
import 'package:biocode/core/widgets/custom_app_bar.dart';
import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:biocode/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:biocode/features/auth/presentation/views/widgets/signin_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<SigninCubit>(
        create: (context) => SigninCubit(
          getIt.get<AuthRepo>(),
        ),
        child: Scaffold(
          appBar: buildAppBar(title: "Sign in"),
          body: const SigninViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
