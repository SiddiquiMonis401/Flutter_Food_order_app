
import 'package:flutter/material.dart';

class FoodGroupedTag extends StatelessWidget {
  final IconData icon;
  final String tagLabel;
  final Color iconColor;

  FoodGroupedTag({Key key, this.icon, this.tagLabel, this.iconColor }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
      child: Row(
      children: [
        Icon(icon, color: iconColor,),
        SizedBox(width: 10,),
        Text('$tagLabel', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
      ],
    ));
  }
}