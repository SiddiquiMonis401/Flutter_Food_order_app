import 'package:flutter/material.dart';

class FoodCartData {
  final String foodName;
  final double foodPrice;
  int itemsInCart;

  FoodCartData(this.foodName, this.foodPrice, this.itemsInCart);
}