import 'package:first_flutter_app/Cubit/Helpers/CartHelper.dart';
import 'package:first_flutter_app/Cubit/cubit/Cartcubit/cartitemscubit_cubit.dart';
import 'package:first_flutter_app/Schemas/FoodCardList.dart';
import 'package:first_flutter_app/Schemas/FoodCartData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDetailPage extends StatelessWidget {
  final FoodCardListItem foodItemDetails;

  const FoodDetailPage({Key key, this.foodItemDetails}) : super(key: key);

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
              FoodDetailPageCircularImage(imagePath: foodItemDetails.imagePath),
              SizedBox(
                height: 60,
              ),
              FoodDetails(
                foodDetails: foodItemDetails,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FoodDetailPageCircularImage extends StatelessWidget {
  final String imagePath;

  const FoodDetailPageCircularImage({Key key, this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2, right: 40, bottom: 2, left: 40),
      child: ClipOval(
        child: Container(
          height: 200,
          width: 200,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class FoodDetails extends StatelessWidget {
  final FoodCardListItem foodDetails;

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

  const FoodDetails({Key key, this.foodDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: BlocBuilder<CartitemscubitCubit, CartitemscubitState>(
            builder: (context, state) {
          int currentItemCount = CartHelper.getCurrentItemCount(
              foodDetails.foodName, state.cartItems);
          bool isItemAddedToCart = currentItemCount > 0;
          // All the layout related to food Details
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Food Name
              Text(
                foodDetails.foodName.toString(),
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico'),
              ),
              // Detail of food
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
              // Choose Amount (Means quantity of food in cart)
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
              // Row with Icons ("+" && "-") for increasing or decreasing the food in cart
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: !isItemAddedToCart
                      ? [
                          Text('Click Add To Cart below'),
                        ]
                      : [
                          InkWell(
                            onTap: () {
                              onAddItemToCart(
                                  context,
                                  FoodCartData(foodDetails.foodName,
                                      foodDetails.foodPrice, 1));
                            },
                            child: Icon(
                              Icons.add_circle_outline,
                              color: Colors.blueGrey,
                            ),
                          ),
                          // Just for gap
                          SizedBox(
                            width: 10,
                          ),

                          if (currentItemCount > 0)
                            Text(currentItemCount.toString()),
                          // Just for gap
                          SizedBox(
                            width: 10,
                          ),
                          // Bottt
                          InkWell(
                            onTap: () {
                              onRemoveItemFromCart(
                                  context,
                                  FoodCartData(foodDetails.foodName,
                                      foodDetails.foodPrice, 1),
                                  isDeleteAction: false);
                            },
                            child: Icon(
                              Icons.remove_circle_outline,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      '\$ ' + foodDetails.foodPrice.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
                                    FoodCartData(foodDetails.foodName,
                                        foodDetails.foodPrice, 1))
                                : onRemoveItemFromCart(
                                    context,
                                    FoodCartData(
                                        foodDetails.foodName,
                                        foodDetails.foodPrice,
                                        currentItemCount));
                          },
                          child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 3,
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
    ));
  }
}
