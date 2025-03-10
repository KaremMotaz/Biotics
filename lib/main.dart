import 'package:biocode/biotics_app.dart';
import 'package:biocode/core/manager/cubit/change_font_cubit.dart';
import 'package:biocode/core/services/get_it_service.dart';
import 'package:biocode/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  runApp(
    BlocProvider(
      create: (context) => ChangeFontCubit(),
      child: const BioticsApp(),
    ),
  );
}
