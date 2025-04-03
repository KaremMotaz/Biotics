import 'package:biocode/core/repos/images_repo/images_repo.dart';
import 'package:biocode/core/services/get_it_service.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:biocode/features/auth/ui/manager/fill_profile_cubit/fill_profile_cubit.dart';
import 'package:biocode/features/home/ui/views/widgets/profile_view_body.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
