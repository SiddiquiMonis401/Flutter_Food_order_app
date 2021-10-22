import 'package:first_flutter_app/Schemas/FoodTabSchema.dart';
import 'package:flutter/material.dart';

class FoodCategoryTab extends StatelessWidget {
  final FoodTabSchema foodTabInfo;
  FoodCategoryTab({this.foodTabInfo});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Container(
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    foodTabInfo.foodName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'Pacifico'),
                  ),
                  Text(
                    foodTabInfo.startingPrice,
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
              SizedBox(
                width: 10,
              )
            ],
          )),
    );
  }
}
