import 'package:biocode/core/widgets/custom_app_bar.dart';
import 'package:biocode/features/home/ui/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: buildAppBar(title: "Home"),
        body: const HomeViewBody(),
      ),
    );
  }
}
