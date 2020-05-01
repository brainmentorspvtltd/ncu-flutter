import 'package:flutter/material.dart';

import './add.dart';
import './list.dart';

class EmpMain extends StatefulWidget {
  @override
  _EmpMainState createState() => _EmpMainState();
}

class _EmpMainState extends State<EmpMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[Add(), ListDemo()],
        ),
      )),
    );
  }
}
