import 'package:biocode/core/services/get_it_service.dart';
import 'package:biocode/core/widgets/custom_app_bar.dart';
import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:biocode/features/auth/ui/manager/signin_cubit/signin_cubit.dart';
import 'package:biocode/features/auth/ui/views/widgets/signin_view_body_bloc_consumer.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SigninCubit>(
      create: (context) => SigninCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(title: S.of(context).Sign_in_title),
        body: const SafeArea(
          child: SigninViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
