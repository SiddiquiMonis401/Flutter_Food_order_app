import 'package:first_flutter_app/Cubit/cubit/Cartcubit/cartitemscubit_cubit.dart';
import 'package:first_flutter_app/Presentation/Components/CartItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<CartitemscubitCubit, CartitemscubitState>(
        builder: (context, state) {
          if (state.cartItems.length == 0) {
            return Center(
              child: Text('No Items in cart please add one!!'),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return CartItem(cartItem: state.cartItems[index]);
              },
              itemCount: state.cartItems.length,
            );
          }
        },
      ),
    );
  }
}
