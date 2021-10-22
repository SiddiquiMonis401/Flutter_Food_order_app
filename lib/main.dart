import 'package:first_flutter_app/Cubit/cubit/BottomNavigationCubit/bottomnavigationcubit_cubit.dart';
import 'package:first_flutter_app/Presentation/Screens/CartDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubit/cubit/Cartcubit/cartitemscubit_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartitemscubitCubit>(
          create: (context) => CartitemscubitCubit(),
        ),
        BlocProvider<BottomnavigationcubitCubit>(
          create: (context) => BottomnavigationcubitCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CartDetails(),
      ),
    );
  }
}
