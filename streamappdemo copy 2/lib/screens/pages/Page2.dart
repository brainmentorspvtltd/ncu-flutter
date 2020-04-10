import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.tealAccent,
      child: Text(
        'I am Page2',
        style: TextStyle(fontSize: 32),
      ),
    );
  }
}
