import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/manager/internet_cubit/internet_cubit.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InternetConnectionView extends StatelessWidget {
  const InternetConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Center(
          child: BlocBuilder<InternetCubit, InternetState>(
            builder: (context, state) {
              final bool hasConnection = state is InternetConnectedState;
        
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.wifi,
                        size: 100,
                      ),
                      Positioned(
                        right: 26,
                        bottom: 4,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: hasConnection ? Colors.green : Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: FaIcon(
                            hasConnection
                                ? FontAwesomeIcons.check
                                : FontAwesomeIcons.xmark,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  Text(
                    hasConnection
                        ? 'You are online'
                        : 'No Internet Connection\nPlease check your internet',
                    textAlign: TextAlign.center,
                    style: TextStyles.medium16,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
