import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            'تسجيل دخول',
            style: TextStyle(
              fontSize: 30,
              fontFamily: "Cairo",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
