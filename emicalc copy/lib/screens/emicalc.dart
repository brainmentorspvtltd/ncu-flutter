import 'package:flutter/material.dart';

import './widgets/button.dart';
import './widgets/result.dart';
import './widgets/textbox.dart';
import '../utils/Format.dart';

class EmiCalc extends StatefulWidget {
  @override
  _EmiCalcState createState() => _EmiCalcState();
}

class _EmiCalcState extends State<EmiCalc> {
  String _result;
  double _pr;
  double _rate;
  double _time;
  double _amount;
  _takePr(String str) {
    if (str != null && str.length > 0) {
      str = str.trim();
    }
    _pr = double.parse(str ?? "0");
  }

  _takeRate(String str) => _rate = double.parse(str ?? "0");

  _takeTime(String str) {
    _time = double.parse(str ?? "0");
  }

  _compute() {
    _amount = (_pr * _rate * _time) / 100;
    setState(() {
      _result = Format.numberFormat(_amount);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EmiCalc'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextBox(
              fn: _takePr,
              hintText: 'Type Principle',
              labelText: 'Principle',
              iconData: Icons.home,
            ),
            TextBox(
              fn: _takeRate,
              hintText: 'Type Rate',
              labelText: 'Rate',
              iconData: Icons.account_balance,
            ),
            TextBox(
              fn: _takeTime,
              hintText: 'Type Time',
              labelText: 'Time',
              iconData: Icons.timer,
            ),
            Button('Calculate', _compute),
            Result(_result)
          ],
        ),
      ),
    );
  }
}
