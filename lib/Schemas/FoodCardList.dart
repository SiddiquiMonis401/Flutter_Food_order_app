import 'package:flutter/material.dart';

@immutable
class FoodCardListItem {
  final String foodName;
  final double foodPrice;
  final String imagePath;
  final double rating;
  final String foodType;

  FoodCardListItem({this.foodName, this.foodPrice, this.imagePath, this.rating, this.foodType});

}