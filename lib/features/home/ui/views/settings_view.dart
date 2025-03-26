import 'package:biocode/core/services/get_it_service.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:biocode/features/auth/ui/manager/cubit/log_out_cubit.dart';
import 'package:biocode/features/home/ui/views/widgets/settings_view_body.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<LogOutCubit>(
        create: (context) => LogOutCubit(
          getIt.get<AuthRepo>(),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).settingsAppbarTitle,
              style: TextStyles.bold18,
            ),
            centerTitle: true,
          ),
          body: const SettingsViewBody(),
        ),
      ),
    );
  }
}
