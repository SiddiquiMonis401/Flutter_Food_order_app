import 'package:first_flutter_app/Mocks/List/FoodTab.dart';
import 'package:first_flutter_app/Presentation/Components/BottomNavigationBar.dart';
import 'package:first_flutter_app/Presentation/Components/CartIcon.dart';
import 'package:first_flutter_app/Presentation/Components/FoodCategoriesRow.dart';
import 'package:first_flutter_app/Presentation/Components/FoodGroupedTag.dart';
import 'package:first_flutter_app/Presentation/Components/TrendingTodaysFood.dart';
import 'package:flutter/material.dart';

class FoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Food Daddy',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [Padding(padding: EdgeInsets.all(10), child: CartIcon(iconColor: Colors.yellow[700], iconSize: 36.00,))],
        backgroundColor: Colors.white,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(2, 20, 2, 20),
              child: FoodCategories(
                foodsList: foodTabsData,
              )),
          FoodGroupedTag(
            icon: Icons.local_offer,
            tagLabel: 'Trending deals',
            iconColor: Colors.yellow[700],
          ),
          TrendingCurrentDayFoods(foodList: foodList,),
          FoodGroupedTag(
            icon: Icons.stars,
            tagLabel: 'Popular Items',
            iconColor: Colors.yellow[700],
          ),
          TrendingCurrentDayFoods(foodList: popularFoodList,),
        ],
      ),
      bottomNavigationBar: new AppBottomNavigationBar(),
    );
  }
}