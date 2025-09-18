import 'package:bookia/core/utils/widgets/arrowbackcontainer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Editprofilescreen extends StatelessWidget {
  const Editprofilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Arrowbackcontainer(),
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(48),
              Usercircleavatar(),
              Gap(16),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(onPressed: () {}, child: Text("Update Profile")),
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
