import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:bookia/feature/cart/cart/presentations/cubit/cartcubit.dart';
import 'package:bookia/feature/cart/cart/presentations/cubit/cartstate.dart';
import 'package:bookia/feature/cart/cart/presentations/widgets/cart_list_view.dart';
import 'package:bookia/feature/cart/cart/presentations/widgets/checkout_and_total.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Cartcubit(),

      child: Scaffold(
        appBar: AppBar(
          title: Text("Cart", style: MytextStyles.main24_400()),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(24),
          child: BlocBuilder(
            builder: (context, state) {
              Cartcubit cartcubit = context.read<Cartcubit>();
              if (state is CartLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is CartError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: CartListView()),
                  CheckoutAndTotal(total: cartcubit.total.toString()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
