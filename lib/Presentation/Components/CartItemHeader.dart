import 'package:first_flutter_app/Cubit/cubit/Cartcubit/cartitemscubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartDetailsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Moday, Feburary 24',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        BlocBuilder<CartitemscubitCubit, CartitemscubitState>(
          builder: (context, state) {
            return Text(
              '(' + state.cartItems.length.toString() + ')',
              style: TextStyle(color: Colors.green[200]),
            );
          },
        )
      ],
    );
  }
}
