import 'dart:io';

import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/services/shared_prefrences/shared_pref.dart';
import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:bookia/feature/profile/profilemain/presenatation/cubit/profile_cubit.dart';
import 'package:bookia/feature/profile/profilemain/presenatation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          ProfileCubit cubit = context.read<ProfileCubit>();
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              actions: [SvgPicture.asset("assets/images/logout.svg")],
              title: Text("Profile"),
            ),
            body: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("Import image From : "),
                                actions: [
                                  TextButton(
                                    onPressed: () async {
                                      cubit.image = await cubit.imagePicker
                                          .pickImage(
                                            source: ImageSource.camera,
                                          );
                                      SharedPref.saveImage(cubit.image!.path);
                                      MyNavigation.pop(context);
                                    },
                                    child: Text("Camera"),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      cubit.image = await cubit.imagePicker
                                          .pickImage(
                                            source: ImageSource.gallery,
                                          );
                                      SharedPref.saveImage(cubit.image!.path);
                                      MyNavigation.pop(context);
                                    },
                                    child: Text("gallary"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: SharedPref.getimage() == null
                            ? const CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage(
                                  'assets/images/default_user.png',
                                ),
                              )
                            : CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(
                                  File(SharedPref.getimage() ?? ""),
                                ),
                              ),
                      ),
                      Gap(20),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              SharedPref.getUserData().name ?? "",
                              style: MytextStyles.main20_600().copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              SharedPref.getUserData().email ?? "",
                              maxLines: 1,
                              style: MytextStyles.sub14_400(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
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
        },
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
      title: Text(
        title,
        style: MytextStyles.main16_400().copyWith(fontSize: 18),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: ontap,
    );
  }
}
