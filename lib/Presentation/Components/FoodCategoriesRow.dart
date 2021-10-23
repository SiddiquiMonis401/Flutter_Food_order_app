import 'package:first_flutter_app/Presentation/Components/FoodCategoryTab.dart';
import 'package:first_flutter_app/Schemas/FoodTabSchema.dart';
import 'package:flutter/material.dart';

class FoodCategories extends StatelessWidget {
  final List<FoodTabSchema> foodsList;
  final Function onTabTap;

  const FoodCategories({Key key, this.foodsList, this.onTabTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (FoodTabSchema foodData in foodsList)
              FoodCategoryTab(
                foodTabInfo: foodData,
                onTabTap: onTabTap,
              )
          ],
        ));
  }
}
