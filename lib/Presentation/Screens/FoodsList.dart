import 'package:first_flutter_app/Mocks/List/FoodTab.dart';
import 'package:first_flutter_app/Presentation/Components/BottomNavigationBar.dart';
import 'package:first_flutter_app/Presentation/Components/CartIcon.dart';
import 'package:first_flutter_app/Presentation/Components/FoodCategoriesRow.dart';
import 'package:first_flutter_app/Presentation/Components/FoodCategoryTab.dart';
import 'package:first_flutter_app/Presentation/Components/FoodGroupedTag.dart';
import 'package:first_flutter_app/Presentation/Components/TrendingTodaysFood.dart';
import 'package:first_flutter_app/Schemas/FoodCardList.dart';
import 'package:first_flutter_app/Schemas/FoodTabSchema.dart';
import 'package:flutter/material.dart';

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  String currentSelectedFoodTab = 'Pizza';

  void onChangeFoodTab(String newTab) {
    setState(() {
      currentSelectedFoodTab = newTab;
    });
  }

  List<FoodCardListItem> getFoodByType(
      String foodType, List<FoodCardListItem> foodList) {
    List<FoodCardListItem> copyFoodList = [];
    foodList.forEach((element) {
      if (element.foodType == foodType) {
        copyFoodList.add(element);
      }
    });
    return copyFoodList;
  }

  @override
  Widget build(BuildContext context) {
    List<FoodCardListItem> filteredFoodList =
        getFoodByType(currentSelectedFoodTab, foodList);
    List<FoodCardListItem> filteredPopularFoodList =
        getFoodByType(currentSelectedFoodTab, popularFoodList);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Food Daddy',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.all(10),
              child: CartIcon(
                iconColor: Colors.yellow[700],
                iconSize: 36.00,
              ))
        ],
        backgroundColor: Colors.white,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(2, 20, 2, 20),
              child: FoodCategories(
                foodsList: foodTabsData,
                onTabTap: (String foodType) => onChangeFoodTab(foodType),
                foodType: currentSelectedFoodTab,
              )),
          FoodGroupedTag(
            icon: Icons.local_offer,
            tagLabel: 'Trending deals',
            iconColor: Colors.yellow[700],
          ),
          TrendingCurrentDayFoods(
            foodList: filteredFoodList,
          ),
          FoodGroupedTag(
            icon: Icons.stars,
            tagLabel: 'Popular Items',
            iconColor: Colors.yellow[700],
          ),
          TrendingCurrentDayFoods(
            foodList: filteredPopularFoodList,
          ),
        ],
      ),
      bottomNavigationBar: new AppBottomNavigationBar(),
    );
  }
}
