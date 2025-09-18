import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Createnewpasswordscreen extends StatelessWidget {
  const Createnewpasswordscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(24),child: Column(children: [
          Arrowbackcontainer(),
              Gap(32),
              Text("Create new password"),
              Text("Your new password must be unique from those previously used."),
              Gap(32),
              TextFormField(
                decoration: InputDecoration(hintText: "New Password"),
              ),
              Gap(16),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              Gap(32),
              ElevatedButton(onPressed: (){}, child: Text("Reset Password")),
        ],),),
      ),
    );
  }
}

class Arrowbackcontainer extends StatelessWidget {
  const Arrowbackcontainer({
    super.key,
  });

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