import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Registerscreen extends StatelessWidget {
  const Registerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
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
                ),
                Gap(32),
                Text("Welcome back! Glad\nto see you, Again!"),
                Gap(32),
                TextFormField(decoration: InputDecoration(hintText: "Username")),
                Gap(16),
                TextFormField(decoration: InputDecoration(hintText: "Email")),
                Gap(16),
            
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                ),
                Gap(16),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                ),
                Gap(32),
                Center(
                  child: ElevatedButton(onPressed: () {}, child: Text("Register")),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account? "),
                    TextButton(onPressed: () {}, child: Text("Register Now")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
