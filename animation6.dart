import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//animated container example 

double generateBorderRadius()=>Random().nextDouble() * 64;
double generateMargin() => Random().nextDouble() * 64;
Color generateColor()=> Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));


class MyAnimatedContainer extends StatefulWidget {
  @override
  _MyAnimatedContainerState createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  Color color;
  double borderRadius;
  double margin;
  @override
  void initState() {
    super.initState();
    color = Colors.deepPurple;
    borderRadius = generateBorderRadius();
    margin = generateMargin();
  }

  void change(){
    setState(() {
      color = generateColor();
      borderRadius = generateBorderRadius();
      margin = generateMargin();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: SizedBox(
                width: 128,
                height: 128,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                   margin: EdgeInsets.all(margin),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              ),
            ),

            RaisedButton(
              child: Text('Change'),
              onPressed: change,
            ),
          ],
        ),
      ),
    );
  }
}
