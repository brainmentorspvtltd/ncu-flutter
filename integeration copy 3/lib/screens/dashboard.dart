import 'package:flutter/material.dart';

import '../utils/server.dart';

class DashBoard extends StatefulWidget {
  var map;
  DashBoard(map) {
    this.map = map;
  }
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String msg = '';
  _getAllStudents() {
    Future<dynamic> future = Server.getAllStudents(widget.map['tokenId']);
    future.then((response) {
      var data = response.body;
      setState(() {
        msg = data;
      });
    }).catchError((err) {
      setState(() {
        msg = err;
      });
    });
  }

  _getAllTest() {
    Future<dynamic> future = Server.getAllTest(widget.map['tokenId']);
    future.then((response) {
      var data = response.body;
      setState(() {
        msg = data;
      });
    }).catchError((err) {
      print("Error is  ");
      print(err);
      setState(() {
        msg = err.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DashBoard'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Text(
              'Welcome ${widget.map['userid']}',
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Card(
                child: Text(
                  'Welcome ${widget.map['userid']} ${widget.map['roleName']}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  _getAllTest();
                },
                child: Text('Test List'),
              ),
              Text(
                msg,
                style: TextStyle(fontSize: 30),
              ),
              RaisedButton(
                onPressed: () {
                  _getAllTest();
                },
                child: Text('Students List'),
              ),
              Text(msg)
            ],
          ),
        ),
      ),
    );
  }
}
