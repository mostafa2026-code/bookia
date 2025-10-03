import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyNavigation {
  static void push(BuildContext context, String route, Object? extra, ) {
    context.push(route, extra: extra);
  }

  static void pushReplace(BuildContext context, String route, Object? extra) {
    context.push(route, extra: extra);
  }

  static void pop(BuildContext context) {
    return context.pop();
  }

  static void go(BuildContext context, String route, Object? extra) {
    return context.go(route, extra: extra);
  }
}
