import 'package:bookia/core/utils/themes/mythemes.dart';
import 'package:bookia/feature/auth/passwordchangedsuccess/passwordchangedsuccessfullyscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Passwordchangedsuccessfullyscreen(),
      theme: Mythemes.lightTheme(),
    );
  }
}
