import 'package:first_flutter_app/Cubit/Helpers/CartHelper.dart';
import 'package:first_flutter_app/Cubit/cubit/Cartcubit/cartitemscubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutTotalBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartitemscubitCubit, CartitemscubitState>(
      builder: (context, state) {
      String cartTotal = CartHelper.calculateCartItemPrice(state.cartItems).toStringAsFixed(2);  
      return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        child: Container(
            // margin: EdgeInsets.symmetric(horizontal: 6),
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: Colors.yellow[700],
            child: Center(
              child: Text('\$ $cartTotal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
            )),
      );
    });
  }
}
