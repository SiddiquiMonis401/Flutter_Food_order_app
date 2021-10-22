import 'package:first_flutter_app/Presentation/Components/CartIcon.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatefulWidget {
  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<AppBottomNavigationBar> {
  int activeNavBar = 0;

  void onTapNavBarItem(int navItemTapped) {
    setState(() {
      activeNavBar = navItemTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 1.0, color: Colors.grey, spreadRadius: 1.0)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => onTapNavBarItem(0),
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Icon(
                Icons.home,
                color: activeNavBar == 0 ? Colors.yellow[700] : Colors.blueGrey,
              ),
            ),
          ),
          InkWell(
            onTap: () => onTapNavBarItem(1),
            // child: Icon(Icons.shopping_cart, color: activeNavBar == 1 ? Colors.yellow[700] : Colors.blueGrey,),
            child: activeNavBar == 1
                ? CartIcon(
                    iconColor: Colors.yellow[700],
                    iconSize: 36.00,
                  )
                : CartIcon(
                    iconColor: Colors.blueGrey,
                    iconSize: 36.00,
                  ),
          ),
          InkWell(
            onTap: () => onTapNavBarItem(2),
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Icon(
                Icons.person,
                color: activeNavBar == 2 ? Colors.yellow[700] : Colors.blueGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
