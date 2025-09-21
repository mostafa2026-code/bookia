import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyNavigation {
  static push(BuildContext context, to) {
    context.push(to);
  }

  static pushReplace(BuildContext context, to) {
    context.push(to);
  }

  static pop(BuildContext context) {
    context.pop();
  }

  static go(BuildContext context, to) {
    context.go(to);
  }
}
