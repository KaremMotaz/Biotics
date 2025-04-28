import '../helpers/spacing.dart';
import '../manager/internet_cubit/internet_cubit.dart';
import '../theming/app_colors.dart';
import '../theming/styles.dart';
import '../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InternetConnectionView extends StatelessWidget {
  const InternetConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
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
                      FaIcon(
                        FontAwesomeIcons.wifi,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : AppColors.gray,
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
                  hasConnection
                      ? Text(
                          S.of(context).youAreOnline,
                          style: TextStyles.bold20,
                        )
                      : Column(
                          children: [
                            Text(
                              S.of(context).noInternetConnection,
                              style: TextStyles.bold20,
                            ),
                            Text(
                              S.of(context).pleaseCheckInternet,
                              style: TextStyles.medium16,
                            ),
                          ],
                        )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
