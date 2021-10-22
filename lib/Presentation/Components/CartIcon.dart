import 'package:first_flutter_app/Cubit/cubit/Cartcubit/cartitemscubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CartIcon extends StatelessWidget {
  final Color iconColor;
  final double iconSize;

  const CartIcon({Key key, this.iconColor, this.iconSize}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartitemscubitCubit, CartitemscubitState>(
      builder: (context, state) {
        int itemInCard = state.count;
        return Stack(children: [
          Icon(
            Icons.shopping_cart,
            color: iconColor,
            size: iconSize,
          ),
          if (itemInCard > 0)
            Positioned(
                child: ClipOval(
              child: Container(
                height: 18,
                width: 18,
                color: Colors.green,
                child: Align(alignment: Alignment.center, child: Text('$itemInCard')),
              ),
            ))
        ]);
      },
    );
  }
}
