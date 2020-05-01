import 'package:flutter/material.dart';

import './Employee.dart';

class EmployeeModel extends ChangeNotifier {
  List<Employee> _empList = [];
  add() {}
  read() {}
  List<Employee> getEmpList() {
    return _empList;
  }

  void addEmp(int id, String name, double salary) {
    _empList.add(new Employee(id, name, salary));
    notifyListeners();
  }
}
