import 'package:bookia/core/routes/myroutes.dart';
import 'package:bookia/core/utils/themes/mythemes.dart';
import 'package:bookia/feature/auth/otpverication/pages/otpvericationscreen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: MyRouts().myroutes,
      theme: Mythemes.lightTheme(),
    );
  }
}
