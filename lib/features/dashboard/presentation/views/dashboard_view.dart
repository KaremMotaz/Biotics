import 'package:biocode/features/dashboard/presentation/views/widgets/dashboard_view_body.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashboardViewBody(),
    );
  }
}