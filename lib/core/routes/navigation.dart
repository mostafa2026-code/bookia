import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyNavigation {
<<<<<<< HEAD
  static void push(BuildContext context, String route , Object? extra) {
    context.push(route ,extra: extra);
  }

  static void pushReplace(BuildContext context,String route , Object? extra) {
    context.push(route,extra: extra);
  }

  static  void pop(BuildContext context, ) {
    return context.pop();
  }

  static void go(BuildContext context,String  route, Object? extra) {
    return context.go(route,extra: extra );
=======
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
>>>>>>> 29f1a12e6da43db7f1200e5f2a56bb57025db2ba
  }
}
