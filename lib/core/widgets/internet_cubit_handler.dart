import '../manager/internet_cubit/internet_cubit.dart';
import 'internet_connection_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../helpers/constants.dart';
import '../services/supabase_storage_service.dart';

class InternetCubitHandler extends StatelessWidget {
  final Widget child;

  const InternetCubitHandler({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnectedState) {
          SupabaseStorageService.createBuckets(kBucketName);
        }
      },
      builder: (context, state) {
        if (state is InternetDisconnectedState) {
          return const InternetConnectionView();
        }
        if (state is InternetConnectedState) {
          return child; // 👈 very important, show the real app if connected
        }
        return child;
      },
    );
  }
}
