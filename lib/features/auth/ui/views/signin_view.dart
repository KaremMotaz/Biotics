import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../domain/auth_repo.dart';
import '../manager/signin_cubit/signin_cubit.dart';
import 'widgets/signin_view_body_bloc_consumer.dart';

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
