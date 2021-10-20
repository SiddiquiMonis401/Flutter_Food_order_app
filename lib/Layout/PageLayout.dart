import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final String pageTitle;
  final bool showBackButton;
  final Widget pageBody;

  // Constructor
  Layout(
      {@required this.pageTitle,
      @required this.showBackButton,
      @required this.pageBody});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageTitle,
          style: TextStyle(color: Colors.teal[700]),
        ),
        automaticallyImplyLeading: showBackButton,
        backgroundColor: Colors.teal[500],
      ),
      body: SafeArea(
        child: pageBody,
      ),
    );
  }
}
