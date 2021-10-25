import 'package:first_flutter_app/Presentation/Components/CardDetails.dart';
import 'package:first_flutter_app/Presentation/Components/CheckoutCard.dart';
import 'package:first_flutter_app/Presentation/Components/CheckoutTotal.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Payment Method',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.yellow[700],
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: ListView(
            scrollDirection: Axis.vertical,
              children: [
                CheckoutTotalBar(),
                CheckoutCard(),
                CardDetails(),
              ],
          ),
        ),
      ),
    );
  }
}
