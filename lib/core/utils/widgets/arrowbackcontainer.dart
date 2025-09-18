import 'package:flutter/material.dart';

class Arrowbackcontainer extends StatelessWidget {
  const Arrowbackcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 41,
        width: 41,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 0.7),
        ),
        child: Center(child: Icon(Icons.arrow_back_ios)),
      ),
    );
  }
}
