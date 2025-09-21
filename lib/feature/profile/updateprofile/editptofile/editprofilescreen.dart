import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:bookia/core/utils/widgets/arrowbackcontainer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Editprofilescreen extends StatelessWidget {
  const Editprofilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Arrowbackcontainer(),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Edit Profile",
                          style: MytextStyles.main24_400(),
                        ),
                      ),
                    ),
                  ],
                ),

                Gap(48),
                Usercircleavatar(),
                Gap(32),
                TextFormField(decoration: InputDecoration(hintText: "Name")),
                Gap(16),
                TextFormField(
                  decoration: InputDecoration(hintText: "Phone Number"),
                ),
                Gap(16),
                TextFormField(decoration: InputDecoration(hintText: "Address")),
                Container(color: Colors.transparent),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: Mainbottm(onpressed: (){}, title: "Update Profile")
      ),
    );
  }
}

class Usercircleavatar extends StatelessWidget {
  const Usercircleavatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 121,
          backgroundImage: AssetImage("assets/images/Ellipse 2 (1).png"),
        ),
        Positioned(
          bottom: 12,
          right: 12,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            padding: EdgeInsets.all(8),
            child: Icon(Icons.camera_alt, size: 28),
          ),
        ),
      ],
    );
  }
}
