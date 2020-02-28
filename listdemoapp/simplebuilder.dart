import 'package:flutter/material.dart';

class SimpleBuilder extends StatefulWidget {
  @override
  _SimpleBuilderState createState() => _SimpleBuilderState();
}

class _SimpleBuilderState extends State<SimpleBuilder> {
  List<String> getList() {
    List<String> list = ["Orange", "Mango", "Apple"];

    return list;
  }

  @override
  Widget build(BuildContext context) {
    List<String> fruits = getList();
    return Scaffold(
        appBar: AppBar(
          title: Text('Simple'),
        ),
        body: ListView.builder(
          itemCount: fruits.length,
          itemBuilder: (parent, index) {
            return Card(
              child: ListTile(
                leading: Icon(
                  Icons.star,
                  color: Colors.redAccent,
                ),
                title: Text(fruits[index]),
              ),
            );
          },
        ));
  }
}
