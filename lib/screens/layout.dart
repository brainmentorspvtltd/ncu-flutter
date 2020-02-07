import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  Container _makeContainer(Color color) {
    return Container(
      width: 50,
      height: 50,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout Demo'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _makeContainer(Colors.red),
          _makeContainer(Colors.green),
          _makeContainer(Colors.yellow)
        ],
      ),
    );
  }
}
