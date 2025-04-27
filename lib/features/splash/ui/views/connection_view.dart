import 'package:biocode/core/widgets/internet_connection_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/manager/internet_cubit/internet_cubit.dart';
import 'package:flutter/material.dart';

class ConnectionView extends StatelessWidget {
  const ConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => InternetCubit(),
          child: const InternetConnectionView(),
        ),
      ),
    );
  }
}
