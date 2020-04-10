import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.lightGreenAccent,
      child: Text(
        'I am Page1',
        style: TextStyle(fontSize: 32),
      ),
    );
  }
}
