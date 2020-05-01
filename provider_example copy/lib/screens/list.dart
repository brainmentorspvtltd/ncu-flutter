import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/EmployeeModel.dart';

class ListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var empModel = Provider.of<EmployeeModel>(context);
    var empList = empModel.getEmpList();
//    return Container(
//      child: Text(
//          'Employee Data is ${empModel != null ? empModel.getEmpList() : 'No Record Exist'}'),
//    );
    return Container(
        height: MediaQuery.of(context).size.height * 0.75,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Name is ${empList[index].name}'),
            );
          },
          itemCount: empList != null ? empList.length : 0,
        ));
  }
}
