
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/excute_naviagtion.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../auth/domain/auth_repo.dart';
import '../../../auth/ui/manager/signin_cubit/signin_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Builder(builder: (context) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
    
          final isOldStudent =
              await BlocProvider.of<SigninCubit>(context).showUserIsOldOrNot();
          if (!context.mounted) return;
          excuteNavigation(context: context, isOldStudent: isOldStudent);
        });
        return const Scaffold(
          body: SafeArea(
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.mainBlue,
              ),
            ),
          ),
        );
      }),
    );
  }
}
