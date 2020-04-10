import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.amberAccent,
      child: Text(
        'I am Page3',
        style: TextStyle(fontSize: 32),
      ),
    );
  }
}
