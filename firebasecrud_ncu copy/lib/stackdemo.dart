import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            height: mediaQuery.height * 0.95,
            width: mediaQuery.width * 0.95,
            color: Colors.orange,
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: mediaQuery.height * 0.70,
            width: mediaQuery.width * 0.70,
            color: Colors.tealAccent,
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: mediaQuery.height * 0.50,
            width: mediaQuery.width * 0.50,
            color: Colors.purple,
          )
        ],
      )),
    );
  }
}
