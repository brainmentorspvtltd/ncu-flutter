import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/EmployeeModel.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController tc = TextEditingController();
  var empModel;
  takeInput() {
    empModel.addEmp(1001, tc.text, 99999.0);
  }

  @override
  Widget build(BuildContext context) {
    String strValue = '';
    empModel = Provider.of<EmployeeModel>(context);
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            style: TextStyle(fontSize: 32),
            controller: tc,
          ),
          RaisedButton(
            child: Text(
              'Add',
              style: TextStyle(fontSize: 32),
            ),
            onPressed: () {
              takeInput();
            },
          )
        ],
      ),
    );
  }
}
