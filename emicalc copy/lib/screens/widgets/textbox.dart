import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  String _hintText;
  String _lblText;
  IconData _icon;
  Function _fn;
  TextBox(
      {Function fn,
      String hintText = 'Type value',
      String labelText = 'Value',
      IconData iconData = Icons.person}) {
    this._fn = fn;
    this._hintText = hintText;
    this._lblText = labelText;
    this._icon = iconData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 4),
      padding: EdgeInsets.all(5),
      child: TextField(
        onChanged: (str) {
          _fn(str);
        },
        keyboardType: TextInputType.numberWithOptions(),
        decoration: InputDecoration(
            prefixIcon: Icon(_icon),
            border: OutlineInputBorder(),
            labelText: _lblText,
            hintText: _hintText,
            hintStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
