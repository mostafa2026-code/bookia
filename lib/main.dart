import 'package:bookia/core/routes/myroutes.dart';
import 'package:bookia/core/services/APi/my_dio_provider.dart';
import 'package:bookia/core/services/shared_prefrences/shared_pref.dart';
import 'package:bookia/core/utils/themes/mythemes.dart';
import 'package:bookia/feature/auth/presentation/cubit/cubit/auth_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.clear();
  SharedPref().init();
  MyDioProvider.init();
  runApp(BlocProvider(create: (_) => AuthCubit(), child: MainApp()));
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
