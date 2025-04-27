import 'package:biocode/biotics_app.dart';
import 'package:biocode/core/helpers/constants.dart';
import 'package:biocode/core/services/get_it_service.dart';
import 'package:biocode/core/services/shared_preferences_singleton.dart';
import 'package:biocode/core/services/supabase_storage_service.dart';
import 'package:biocode/core/theming/app_colors.dart';
import 'package:biocode/features/splash/ui/views/connection_view.dart';
import 'package:biocode/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/internet_cubit/internet_cubit.dart';

class AppInitializer extends StatefulWidget {
  const AppInitializer({super.key});

  @override
  State<AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
  bool _isInitialized = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state) {
        if (state is InternetDisconnectedState) {
          return const ConnectionView();
        }

        if (state is InternetConnectedState && !_isInitialized) {
          _initializeApp();
        }

        if (_isInitialized) {
          return const BioticsApp();
        }

        // Show loading state while initializing
        return const Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: CircularProgressIndicator(
              color: AppColors.mainBlue,
            ),
          ),
        );
      },
    );
  }

  Future<void> _initializeApp() async {
    try {
      // Only initialize Supabase if there's internet

      WidgetsFlutterBinding.ensureInitialized();
      await Prefs.init();
      await SupabaseStorageService.initSupabase();
      await SupabaseStorageService.createBuckets(kBucketName);
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      setupGetIt();

      setState(() => _isInitialized = true);
    } catch (e) {
      // Handle initialization failure if needed
      setState(() => _isInitialized = false);
    }
  }
}
