import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/EmployeeModel.dart';
import './screens/empmain.dart';

void main() {
  runApp(ChangeNotifierProvider(
      builder: (ctx) => EmployeeModel(),
      child: MaterialApp(
        home: EmpMain(),
      )));
}
