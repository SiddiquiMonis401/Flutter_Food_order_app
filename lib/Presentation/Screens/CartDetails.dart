import 'package:first_flutter_app/Cubit/Helpers/CartHelper.dart';
import 'package:first_flutter_app/Cubit/cubit/Cartcubit/cartitemscubit_cubit.dart';
import 'package:first_flutter_app/Presentation/Components/BottomNavigationBar.dart';
import 'package:first_flutter_app/Presentation/Components/CartIemsList.dart';
import 'package:first_flutter_app/Presentation/Components/CartItem.dart';
import 'package:first_flutter_app/Presentation/Components/CartItemHeader.dart';
import 'package:first_flutter_app/Presentation/Screens/Checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
            child: Text(
          'Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 4, bottom: 40),
                child: CartDetailsHeader(),
              ),
              // Cart items List
              Expanded(
                  child: CartItemsList() 
              ),
              // Total Of Cart
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 4),
                child: BlocBuilder<CartitemscubitCubit, CartitemscubitState>(
                  builder: (context, state) {
                    double totalOfCart = CartHelper.calculateCartItemPrice(state.cartItems);
                    return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total',
                                      style: TextStyle(color: Colors.blueGrey),
                                    ),
                                    Text('\$ ' + totalOfCart.toStringAsFixed(2),
                                        style: TextStyle(
                                            color: Colors.black, fontWeight: FontWeight.bold))
                                  ],
                                );
                  },
                ),
              ),
              //Add To Cart Button
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: InkWell(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return CheckoutPage();
                            }));
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 40,
                              color: Colors.yellow[700],
                              child: Center(
                                child: Text(
                                  'Checkout',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )),
                        )),
                  ),
                ),
              )
            ],
          )),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
