import 'package:biocode/features/home/presentation/views/home_view.dart';
import 'package:biocode/features/home/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => HomeView(),
        );
      case "ProfileView":
        return MaterialPageRoute(
          builder: (_) => ProfileView(),
        );
    }
    return null;
  }
}
