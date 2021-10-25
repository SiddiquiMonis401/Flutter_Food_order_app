import 'package:flutter/material.dart';

class CheckoutCard extends StatelessWidget {
  final Widget bankName = Text(
    'Bank Al-Habib',
    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
  );
  final Widget creditCardNumberPlaceHolder = Text(
    'XXXX-XXXX-XXXX-XXXX',
    style: TextStyle(color: Colors.white),
  );
  final Widget cardHolderName = Expanded(
      child: Text(
    'M. Muhammad Monis Mazhar',
    style: TextStyle(color: Colors.white),
  ));

  final Widget expiryDateForCardWithTitle = Expanded(
      child: Column(
    children: [
      Text(
        'Expiry Date - MM/YY',
        style: TextStyle(color: Colors.white),
      ),
      Text(
        '10/26',
        style: TextStyle(color: Colors.white),
      )
    ],
  ));

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30, bottom: 20),
                child: Text(
                  'Make Payment',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 180,
                    width: MediaQuery.of(context).size.width - 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/cardbackground.jpeg'),
                            fit: BoxFit.cover)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        bankName,
                        creditCardNumberPlaceHolder,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            cardHolderName,
                            expiryDateForCardWithTitle
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]));
  }
}
