import 'package:first_flutter_app/Cubit/Helpers/CartHelper.dart';
import 'package:first_flutter_app/Cubit/cubit/Cartcubit/cartitemscubit_cubit.dart';
import 'package:first_flutter_app/Schemas/FoodCardList.dart';
import 'package:first_flutter_app/Schemas/FoodCartData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDetailPage extends StatelessWidget {
  final FoodCardListItem foodItemDetails;

  const FoodDetailPage({Key key, this.foodItemDetails}) : super(key: key);

  void onAddItemToCart(BuildContext context, FoodCartData itemToAdd) {
    BlocProvider.of<CartitemscubitCubit>(context).addItemToCart(itemToAdd);
  }

  void onRemoveItemFromCart(BuildContext context, FoodCartData itemToRemove,
      {isDeleteAction = true}) {
    if (isDeleteAction) {
      BlocProvider.of<CartitemscubitCubit>(context)
          .deleteItemFromList(itemToRemove);
    } else {
      BlocProvider.of<CartitemscubitCubit>(context)
          .removeItemToCart(itemToRemove);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellow[700],
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.favorite,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.yellow[700],
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 2, right: 40, bottom: 2, left: 40),
                child: ClipOval(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      foodItemDetails.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Expanded(
                  child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                child: Container(
                  padding:
                      EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: BlocBuilder<CartitemscubitCubit, CartitemscubitState>(
                      builder: (context, state) {
                    int currentItemCount = CartHelper.getCurrentItemCount(
                        foodItemDetails.foodName, state.cartItems);
                    bool isItemAddedToCart = currentItemCount > 0;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          foodItemDetails.foodName.toString(),
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Pacifico'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'You might want to create a list that scrolls horizontally rather than vertically. The ListView widget supports horizontal lists. Use the standard ListView constructor, passing in a horizontal scrollDirection, which overrides the default vertical direction.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.blueGrey[50],
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Choose Amount',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (isItemAddedToCart)
                              InkWell(
                                onTap: () {
                                  onAddItemToCart(
                                      context,
                                      FoodCartData(foodItemDetails.foodName,
                                          foodItemDetails.foodPrice, 1));
                                },
                                child: Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            SizedBox(
                              width: 10,
                            ),
                            if (!isItemAddedToCart)
                              Text('Click Add To Cart below'),
                            if (currentItemCount > 0)
                              Text(currentItemCount.toString()),
                            SizedBox(
                              width: 10,
                            ),
                            if (isItemAddedToCart)
                              InkWell(
                                onTap: () {
                                  onRemoveItemFromCart(
                                      context,
                                      FoodCartData(foodItemDetails.foodName,
                                          foodItemDetails.foodPrice, 1),
                                      isDeleteAction: false);
                                },
                                child: Icon(
                                  Icons.remove_circle_outline,
                                  color: Colors.blueGrey,
                                ),
                              ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                '\$ ' + foodItemDetails.foodPrice.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20)),
                                  child: InkWell(
                                    onTap: () {
                                      !isItemAddedToCart
                                          ? onAddItemToCart(
                                              context,
                                              FoodCartData(
                                                  foodItemDetails.foodName,
                                                  foodItemDetails.foodPrice,
                                                  1))
                                          : onRemoveItemFromCart(
                                              context,
                                              FoodCartData(
                                                  foodItemDetails.foodName,
                                                  foodItemDetails.foodPrice,
                                                  currentItemCount));
                                    },
                                    child: Container(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        color: Colors.yellow[700],
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(currentItemCount > 0
                                              ? 'Remove from Cart'
                                              : 'Add to Cart'),
                                        )),
                                  )),
                            )
                          ],
                        ),
                      ],
                    );
                  }),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
