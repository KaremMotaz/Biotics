import '../../../../../core/functions/build_snack_bar.dart';
import '../../../../../core/routing/routes.dart';
import '../../manager/fill_profile_cubit/fill_profile_cubit.dart';
import 'fill_profile_view_body.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FillProfileViewBodyBlocConsumer extends StatelessWidget {
  const FillProfileViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FillProfileCubit, FillProfileState>(
      listener: (context, state) {
        if (state is FillProfileSuccessState) {
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
