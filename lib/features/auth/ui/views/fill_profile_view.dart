import 'package:biocode/core/repos/images_repo/images_repo.dart';
import 'package:biocode/core/services/get_it_service.dart';
import 'package:biocode/core/widgets/custom_app_bar.dart';
import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:biocode/features/auth/ui/manager/fill_profile_cubit/fill_profile_cubit.dart';
import 'package:biocode/features/auth/ui/views/widgets/fill_profile_view_body_bloc_consumer.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FillProfileView extends StatelessWidget {
  const FillProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FillProfileCubit>(
      create: (context) => FillProfileCubit(
        getIt.get<AuthRepo>(),
        getIt.get<ImagesRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(title: S.of(context).fillProfileAppBar),
        body: const SafeArea(
          child: FillProfileViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
