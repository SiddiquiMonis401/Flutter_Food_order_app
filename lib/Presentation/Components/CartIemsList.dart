import 'package:first_flutter_app/Cubit/cubit/Cartcubit/cartitemscubit_cubit.dart';
import 'package:first_flutter_app/Presentation/Components/CartItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemsList extends StatefulWidget {
  @override
  _CartItemsListState createState() => _CartItemsListState();
}

class _CartItemsListState extends State<CartItemsList> {

  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    Future<void> _onRefresh() {
      setState(() {
              opacity = 0;
      });
      return Future.delayed(
        Duration(seconds: 2),
        () => {
          setState(() {
            opacity = 1;
          })
        }
      );
    }
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: AnimatedOpacity(
        duration: Duration(seconds: 2),
        opacity: opacity,
        child: Container(
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
        ),
      ),
    );
  }
}
