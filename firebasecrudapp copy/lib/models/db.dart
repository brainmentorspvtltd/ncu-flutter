import 'package:cloud_firestore/cloud_firestore.dart';

import './emp.dart';

class Db {
  final dbReference = Firestore.instance;
  // C
  add(Employee emp) async {
    var documentRef = await dbReference.collection('emps').add(emp.toMap());
    return documentRef;
  }

  update() {}
  remove() {}
  // R
  Future read() {
    return dbReference.collection("emps").getDocuments();
  }
}
