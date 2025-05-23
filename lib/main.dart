import 'package:biocode/biotics_app.dart';
import 'package:biocode/core/helpers/constants.dart';
import 'package:biocode/core/services/get_it_service.dart';
import 'package:biocode/core/services/shared_preferences_singleton.dart';
import 'package:biocode/core/services/supabase_storage_service.dart';
import 'package:biocode/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  await SupabaseStorageService.initSupabase();
  await SupabaseStorageService.createBuckets(kBucketName);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();

  runApp(
    const BioticsApp(),
  );
}
