import 'package:biocode/features/home/ui/views/widgets/custom_home_appbar.dart';
import 'package:biocode/features/home/ui/views/widgets/home_view_body.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildHomeAppBar(
          title: S.of(context).homeAppbarTitle,
          context: context,
        ),
        body: const HomeViewBody(),
      ),
    );
  }
}
