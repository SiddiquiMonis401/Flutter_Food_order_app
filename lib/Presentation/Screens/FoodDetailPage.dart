import 'package:flutter/material.dart';

class FoodDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellow[700],
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.favorite,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.yellow[700],
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 2, right: 40, bottom: 2, left: 40),
                child: ClipOval(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      'images/pizza.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Expanded(
                  child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                child: Container(
                  padding:
                      EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Pizza',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Pacifico'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'You might want to create a list that scrolls horizontally rather than vertically. The ListView widget supports horizontal lists. Use the standard ListView constructor, passing in a horizontal scrollDirection, which overrides the default vertical direction.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.blueGrey[50],
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Choose Amount',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_circle_outline,
                            color: Colors.blueGrey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('1'),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.remove_circle_outline,
                            color: Colors.blueGrey,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              '\$ 8.0',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)),
                              child: Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width / 3,
                                  color: Colors.yellow[700],
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('Add To Cart'),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
