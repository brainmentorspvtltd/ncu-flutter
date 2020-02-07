import 'package:flutter/material.dart';

class CountDown extends StatelessWidget {
  int count = 0;
  CountDown() {
    print("Cons Call");
  }
  @override
  Widget build(BuildContext context) {
    print("Build Called...");
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'CountDown App..',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: RaisedButton(
        elevation: 10,
        shape: CircleBorder(),
        color: Colors.redAccent,
        padding: EdgeInsets.all(7),
        onPressed: () {
          count++;
          print("Count is $count");
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: Container(
        //margin: EdgeInsets.all(30),
        //padding: EdgeInsets.all(20),
        child: Center(
          child: Text(
            'Count Down is $count',
            style: TextStyle(fontSize: 30),
          ),
        ),
        color: Colors.tealAccent,
      ),
    );
  }
}
