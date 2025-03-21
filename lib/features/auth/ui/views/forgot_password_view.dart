import 'package:biocode/core/services/get_it_service.dart';
import 'package:biocode/core/widgets/custom_app_bar.dart';
import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:biocode/features/auth/ui/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:biocode/features/auth/ui/views/widgets/forgot_password_view_body_bloc_consumer.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<ForgotPasswordCubit>(
        create: (context) => ForgotPasswordCubit(
          getIt.get<AuthRepo>(),
        ),
        child: Scaffold(
          appBar: buildAppBar(title: S.of(context).forgot_password_appbar),
          body: const ForgotPasswordViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
