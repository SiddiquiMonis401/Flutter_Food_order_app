import 'package:first_flutter_app/Cubit/cubit/BottomNavigationCubit/bottomnavigationcubit_cubit.dart';
import 'package:first_flutter_app/Presentation/Components/CartIcon.dart';
import 'package:first_flutter_app/Presentation/Screens/CartDetails.dart';
import 'package:first_flutter_app/Presentation/Screens/FoodsList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBottomNavigationBar extends StatelessWidget {
  void onTapNavBarItem(int navItemTapped, BuildContext context) {
    BlocProvider.of<BottomnavigationcubitCubit>(context).changeBottomNavigationTab(navItemTapped);
    // just a comment
    switch (navItemTapped) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FoodList()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CartDetails()));
        break;
      case 2:
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => CartDetails()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 1.0, color: Colors.grey, spreadRadius: 1.0)
      ]),
      child:
          BlocBuilder<BottomnavigationcubitCubit, BottomNavigationCubitState>(
              builder: (context, state) {
        int activeTab = state.currentActiveTab;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => onTapNavBarItem(0, context),
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Icon(
                  Icons.home,
                  color: activeTab == 0 ? Colors.yellow[700] : Colors.blueGrey,
                ),
              ),
            ),
            InkWell(
              onTap: () => onTapNavBarItem(1, context),
              child: activeTab == 1
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
              onTap: () => onTapNavBarItem(2, context),
              child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Icon(
                    Icons.person,
                    color:
                        activeTab == 2 ? Colors.yellow[700] : Colors.blueGrey,
                  )),
            )
          ],
        );
      }),
    );
  }
}
