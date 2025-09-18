import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.logout_outlined)),
        ],
        title: Text("Profile"),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(
                    "assets/images/Ellipse 2 (1).png",
                  ),
                ),
                Gap(20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Name"), Text("Email")],
                ),
              ],
            ),
            Gap(32),
            Mylisttileprofile(title: "My Order", ontap: () {}),
            Mylisttileprofile(title: "Edit Profile", ontap: () {}),
            Mylisttileprofile(title: "Reset Password", ontap: () {}),
            Mylisttileprofile(title: "FAQ", ontap: () {}),
            Mylisttileprofile(title: "Contact Us", ontap: () {}),
            Mylisttileprofile(title: "Privacy & Terms", ontap: () {}),
          ],
        ),
      ),
    );
  }
}
class Mylisttileprofile extends StatelessWidget {
  final String title;
  final Function() ontap;
  const Mylisttileprofile({
    super.key,
    required this.title,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: ontap,
    );
  }
}
