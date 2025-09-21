import 'package:bookia/component/widgets/myappbar.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Createnewpasswordscreen extends StatelessWidget {
  const Createnewpasswordscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowbackAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Create new password"),
                Text(
                  "Your new password must be unique from those previously used.",
                ),
                Gap(32),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "New Password",
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
                Gap(100),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Reset Password"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
