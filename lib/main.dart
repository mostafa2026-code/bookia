import 'package:bookia/core/utils/themes/mythemes.dart';
import 'package:bookia/feature/auth/login/loginscreen.dart';
import 'package:bookia/feature/auth/passwordchangedsuccess/passwordchangedsuccessfullyscreen.dart';
import 'package:bookia/feature/cart/success/congratulationscreen.dart';
import 'package:bookia/feature/profile/profilemain/profilescreen.dart';
import 'package:bookia/feature/profile/updatepassword/editpassword/editpassword.dart';
import 'package:bookia/feature/profile/updateprofile/editptofile/editprofilescreen.dart';
import 'package:bookia/feature/welcome/welcomescreen.dart';

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
