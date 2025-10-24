import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:bookia/feature/cart/cart/presentations/cubit/cartcubit.dart';
import 'package:bookia/feature/cart/cart/presentations/cubit/cartstate.dart';
import 'package:bookia/feature/cart/cart/presentations/widgets/cart_list_view.dart';
import 'package:bookia/feature/cart/cart/presentations/widgets/checkout_and_total.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Cartcubit>(
      create: (context) => Cartcubit()..getAllCartItems(),

      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Cart", style: MytextStyles.main24_400()),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(24),
          child: BlocBuilder<Cartcubit, CartState>(
            builder: (context, state) {
              final Cartcubit cartcubit = context.read<Cartcubit>();
              if (state is CartLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is CartError) {
                return Center(child: Text(state.message));
              } else if (state is CartSuccess) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CartListView(
                        cartItems: cartcubit.cartList,
                        cubit: cartcubit,
                      ),
                    ),
                    CheckoutAndTotal(total: cartcubit.total.toString()),
                  ],
                );
              } else {
                return Center(child: Text("Something went wrong"));
              }
            },
          ),
        ),
      ),
    );
  }
}
