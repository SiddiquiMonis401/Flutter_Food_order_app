import 'package:first_flutter_app/Presentation/Components/FoodCard.dart';
import 'package:first_flutter_app/Presentation/Screens/FoodDetailPage.dart';
import 'package:first_flutter_app/Schemas/FoodCardList.dart';
import 'package:first_flutter_app/Schemas/FoodCartData.dart';
import 'package:flutter/material.dart';


class TrendingCurrentDayFoods extends StatelessWidget {
  final List<FoodCardListItem> foodList;

  const TrendingCurrentDayFoods({Key key,@required this.foodList}) : super(key: key);

  void onCardTap(BuildContext context, FoodCardListItem cartDetails){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FoodDetailPage(foodItemDetails: cartDetails)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, count) {
        FoodCardListItem currentCardDetails = foodList[count];
        return FoodCard(cardData: foodList[count], onCardTap: () {
          onCardTap(context, currentCardDetails);
        },);
      },
      itemCount: foodList.length,
      )
    );
  }
}