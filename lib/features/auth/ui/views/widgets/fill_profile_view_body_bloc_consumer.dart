import 'package:biocode/core/functions/build_snack_bar.dart';
import 'package:biocode/core/routing/routes.dart';
import 'package:biocode/features/auth/ui/manager/fill_profile_cubit/fill_profile_cubit.dart';
import 'package:biocode/features/auth/ui/views/widgets/fill_profile_view_body.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FillProfileViewBodyBlocConsumer extends StatelessWidget {
  const FillProfileViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FillProfileCubit, FillProfileState>(
      listener: (context, state) {
        if (State is FillProfileSuccessState) {
          successSnackBar(
            context: context,
            message: S.of(context).fill_profile_success_message,
          );
          GoRouter.of(context).pushReplacement(Routes.homeView);
        } else if (state is FillProfileFailureState) {
          errorSnackBar(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        return const FillProfileViewBody();
      },
    );
  }
}
