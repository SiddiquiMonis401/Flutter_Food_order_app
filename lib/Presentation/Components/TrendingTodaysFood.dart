import 'package:first_flutter_app/Presentation/Components/FoodCard.dart';
import 'package:first_flutter_app/Schemas/FoodCardList.dart';
import 'package:flutter/material.dart';


class TrendingCurrentDayFoods extends StatelessWidget {
  final List<FoodCardListItem> foodList;

  const TrendingCurrentDayFoods({Key key,@required this.foodList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, count) {
        return FoodCard(cardData: foodList[count]);
      },
      itemCount: foodList.length,
      )
    );
  }
}