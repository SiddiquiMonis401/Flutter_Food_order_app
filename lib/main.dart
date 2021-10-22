import 'package:first_flutter_app/Cubit/cubit/counter_cubit_dart_cubit.dart';
import 'package:first_flutter_app/Cubit/cubit/cubit/cartitemscubit_cubit.dart';
import 'package:first_flutter_app/Presentation/Screens/CartDetails.dart';
import 'package:first_flutter_app/Presentation/Screens/FoodDetailPage.dart';
import 'package:first_flutter_app/Presentation/Screens/FoodsList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartitemscubitCubit>(
      create: (context) => CartitemscubitCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: FoodList(),
        // home: FoodList(),
        home: CartDetails(),
      ),
    );
  }
}
