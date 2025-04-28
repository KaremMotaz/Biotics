import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import 'widgets/custom_home_appbar.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomeAppBar(
        title: S.of(context).homeAppbarTitle,
        context: context,
      ),
      body: const SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}
