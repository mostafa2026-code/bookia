import 'package:bookia/core/utils/widgets/arrowbackcontainer.dart';
import 'package:bookia/feature/profile/updateprofile/editptofile/editprofilescreen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Editpassword extends StatelessWidget {
  const Editpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Arrowbackcontainer(),
            Gap(48),
            Center(child: Text("New Password")),
            Gap(32),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Current Password",
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            Gap(16),
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
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(onPressed: () {}, child: Text("Update Password")),
      ),
    );
  }
}
