import 'package:first_flutter_app/Cubit/cubit/cubit/cartitemscubit_cubit.dart';
import 'package:first_flutter_app/Schemas/FoodCartData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  final FoodCartData cartItem;

  void onAddItemToCart(BuildContext context) {
    BlocProvider.of<CartitemscubitCubit>(context).addItemToCart(cartItem);
  }

  void onRemovingItemToCart(BuildContext context) {
    BlocProvider.of<CartitemscubitCubit>(context).removeItemToCart(cartItem);
  }
  void deleteItemFromCart(BuildContext context) {
    BlocProvider.of<CartitemscubitCubit>(context).deleteItemFromList(cartItem);
  }
  

  const CartItem({Key key, this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image(
                height: 70,
                image: AssetImage('images/pizza.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cartItem.foodName.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => onRemovingItemToCart(context),
                    child: Icon(
                      Icons.remove,
                      size: 14,
                      color: Colors.blueGrey,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    cartItem.itemsInCart.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () => onAddItemToCart(context),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                  )
                ],
              ),
            ],
          )),
          Container(
              width: 60,
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('\$ ' + cartItem.foodPrice.toStringAsFixed(2),
                      style: TextStyle(color: Colors.blueGrey, fontSize: 10)),
                  InkWell(
                    onTap: () => deleteItemFromCart(context),
                    child: Icon(
                    Icons.delete_forever,
                    size: 30,
                    color: Colors.yellow[700],
                  ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
