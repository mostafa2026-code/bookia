import 'package:bookia/component/widgets/mainbottm.dart';
import 'package:bookia/core/routes/myroutes.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/feature/cart/cart/presentations/cubit/cartcubit.dart';
import 'package:bookia/feature/cart/cart/presentations/cubit/cartstate.dart';
import 'package:bookia/feature/place/govs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({super.key, required this.total});
  final String total;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocConsumer<Cartcubit, CartState>(
      listener: (context, state) {
        if (state is CartSuccess) {
          MyNavigation.push(context, MyRouts.congratulationscreen, null);
        } else if (state is CartError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        Cartcubit cartcubit = context.watch<Cartcubit>();
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,

              child: Column(
                spacing: 20,
                children: [
                  TextFormField(
                    controller: cartcubit.nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: "Name"),
                  ),
                  TextFormField(
                    controller: cartcubit.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Your email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: "email"),
                  ),
                  TextFormField(
                    controller: cartcubit.addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: "Address"),
                  ),
                  TextFormField(
                    controller: cartcubit.phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: "Phone"),
                  ),
                  TextFormField(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (bottomsheetcontext) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,

                            children: [
                              Expanded(
                                child: ListView.separated(
                                  itemCount: govs.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                        return Divider();
                                      },
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                        return ListTile(
                                          onTap: () {
                                            cartcubit
                                                    .governorateController
                                                    .text =
                                                govs[index];
                                            cartcubit.governorateId = govs
                                                .indexOf(govs[index]);
                                            Navigator.pop(context);
                                          },
                                          title: Text(
                                            govs[index],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                          ),
                                          trailing:
                                              cartcubit.governorateId == index
                                              ? const Icon(Icons.check)
                                              : null,
                                        );
                                      },
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    readOnly: true,
                    controller: cartcubit.governorateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: "Governerate"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Total"), Text(total)],
                  ),
                  Mainbottm(
                    onpressed: () {
                      if (formKey.currentState!.validate()) {
                        MyNavigation.pushReplace(
                          context,
                          MyRouts.congratulationscreen,
                          null,
                        );
                      }
                    },
                    title: "Submit Order",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
