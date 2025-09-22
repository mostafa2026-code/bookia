import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyNavigation {
  static push(BuildContext context, String route) {
    context.push(route);
  }

  static pushReplace(BuildContext context,String route) {
    context.push(route);
  }

  static pop(BuildContext context) {
    context.pop();
  }

  static go(BuildContext context,String  route) {
    context.go(route);
  }
}
