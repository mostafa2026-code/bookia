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

void showloadingDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(content: CircularProgressIndicator());
    },
  );
}



bool isvalidEmail(String email) {
    final RegExp regExp = RegExp(
      r"^(?:[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*)@"
      r"(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z]{2,}$",
    );
    return regExp.hasMatch(email);
  }

  bool isvalidpassword(String email) {
    final RegExp simplePass = RegExp(r'^.{8,}$');
    return simplePass.hasMatch(email);
  }