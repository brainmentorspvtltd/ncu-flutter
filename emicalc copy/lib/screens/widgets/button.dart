import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String _txt;
  Function _fn;
  Button(this._txt, this._fn);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: RaisedButton(
        padding: EdgeInsets.all(15),
        elevation: 10,
        color: Colors.lightBlue,
        onPressed: () {
          _fn();
        },
        child: Text(
          '$_txt',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
