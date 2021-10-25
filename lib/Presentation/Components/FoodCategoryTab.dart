import 'package:first_flutter_app/Schemas/FoodTabSchema.dart';
import 'package:flutter/material.dart';

class FoodCategoryTab extends StatelessWidget {
  final FoodTabSchema foodTabInfo;
  final Function onTabTap;
  final String foodType;

  FoodCategoryTab({this.foodTabInfo, this.onTabTap, this.foodType});

  @override
  Widget build(BuildContext context) {
    bool isTabSelected = foodTabInfo.foodName == foodType;
    return InkWell(
        onTap: () => onTabTap(foodTabInfo.foodName),
        child: Card(
          color: Colors.white,
          elevation: isTabSelected ? 6 : 2,
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: isTabSelected ? 4 : 0, color: Colors.yellow[700])),
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: 100,
                          minHeight: 100,
                          maxWidth: 60,
                          minWidth: 60),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 2, 10),
                        child: CircleAvatar(
                            backgroundImage: AssetImage(
                          'images/pizza.jpeg',
                        )),
                      )),
                    Flexible(
                      flex: 1,
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          foodTabInfo.foodName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: 'Pacifico'
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          foodTabInfo.startingPrice,
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              )),
        ));
  }
}
