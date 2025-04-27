import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../domain/auth_repo.dart';
import '../manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'widgets/forgot_password_view_body_bloc_consumer.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgotPasswordCubit>(
      create: (context) => ForgotPasswordCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(title: S.of(context).forgot_password_appbar),
        body: const SafeArea(
          child: ForgotPasswordViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
