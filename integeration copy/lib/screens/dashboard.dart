import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  var map;
  DashBoard(map) {
    this.map = map;
  }
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
