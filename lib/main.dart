import 'package:bookia/core/routes/myroutes.dart';
import 'package:bookia/core/services/APi/my_dio_provider.dart';
import 'package:bookia/core/utils/themes/mythemes.dart';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MyDioProvider.init;
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
