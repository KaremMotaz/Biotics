import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/repos/images_repo/images_repo.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/domain/auth_repo.dart';
import '../../../auth/ui/manager/fill_profile_cubit/fill_profile_cubit.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FillProfileCubit(
        getIt.get<AuthRepo>(),
        getIt.get<ImagesRepo>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).profile_appbar,
            style: TextStyles.bold18,
          ),
          centerTitle: true,
        ),
        body: const ProfileViewBody(),
      ),
    );
  }
}
