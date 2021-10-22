import 'package:flutter/material.dart';

@immutable
class FoodCardListItem {
  final String foodName;
  final double foodPrice;
  final String imagePath;
  final double rating;

  FoodCardListItem({this.foodName, this.foodPrice, this.imagePath, this.rating});

}