import '../../../../core/services/get_it_service.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../domain/auth_repo.dart';
import '../manager/signup_cubit/signup_cubit.dart';
import 'widgets/signup_view_body_bloc_consumer.dart';
import '../../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupCubit>(
      create: (context) => SignupCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(title: S.of(context).signup_appbar_title),
        body: const SafeArea(
          child: SignupViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
