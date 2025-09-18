import 'package:flutter/material.dart';

class Mynavigation {
  static push(BuildContext context,Widget to) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return to;
        },
      ),
    );
  }


  static pushreplace(BuildContext context,Widget to) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return to;
        },
      ),
    );
  }



  static pushremoveuntil(BuildContext context,Widget until) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return until;
        },
      ),
      (route)=>false
    );
  }
}
