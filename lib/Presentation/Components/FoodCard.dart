import 'package:first_flutter_app/Cubit/cubit/Cartcubit/cartitemscubit_cubit.dart';
import 'package:first_flutter_app/Schemas/FoodCardList.dart';
import 'package:first_flutter_app/Schemas/FoodCartData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodCard extends StatelessWidget {
  final FoodCardListItem cardData;
  final Function onCardTap;

  const FoodCard({Key key, this.cardData, this.onCardTap}) : super(key: key);

  void onAddItemToCart(FoodCartData item, BuildContext context) {
    BlocProvider.of<CartitemscubitCubit>(context).addItemToCart(item);
  }

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    return BlocListener<CartitemscubitCubit, CartitemscubitState>(
        listener: (context, state) {
          // Need to
        },
        child: InkWell(
          onTap: onCardTap,
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Card(
                elevation: 0.0,
                child: Container(
                  padding: EdgeInsets.all(6),
                  height: 300,
                  width: screenSize / 2 - 10,
                  // color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 200,
                        width: (screenSize / 2) - 25,
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Image(
                              image: AssetImage('images/pizza.jpeg'),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Text(
                        cardData.foodName.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.0),
                      ),
                      Row(children: [
                        for (var i = 0; i < 5; i++)
                          Icon(
                            i < cardData.rating
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.orange[300],
                            size: 18,
                          ),
                        Text(
                          '(' + cardData.rating.toStringAsFixed(2) + ')',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blueGrey,
                          ),
                        )
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$ ' + cardData.foodPrice.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ClipRRect(
                            borderRadius:
                                BorderRadius.all((Radius.circular(2))),
                            child: Container(
                              child: Align(
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {
                                      onAddItemToCart(
                                          FoodCartData(cardData.foodName,
                                              cardData.foodPrice, 1),
                                          context);
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                  )),
                              height: 20,
                              width: 20,
                              color: Colors.yellow[700],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ));
  }
}
