import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  Widget cardDetailForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Credit Card Number',
            style: TextStyle(color: Colors.blueGrey),
          ),
          TextFormField(),
          Text('Full Name', style: TextStyle(color: Colors.blueGrey)),
          TextFormField(),
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Expiry Date',
                          style: TextStyle(color: Colors.blueGrey)),
                      TextFormField()
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CVV', style: TextStyle(color: Colors.blueGrey)),
                      TextFormField()
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget confirmPaymentDetail(double screenWidth) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          width: screenWidth / 3,
          height: 50,
          color: Colors.yellow[700],
          child: Center(
            child: Text(
              'Pay Now',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: Text(
                'Payment Details',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Container(
              width: screenWidth,
              padding: EdgeInsets.symmetric(vertical: 20),
              color: Colors.white,
              child: cardDetailForm(),
            ),
          ),
          Center(child: confirmPaymentDetail(screenWidth))
        ],
      ),
    );
  }
}
