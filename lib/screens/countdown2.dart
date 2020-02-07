import 'package:flutter/material.dart';

class CountDown2 extends StatefulWidget {
  @override
  _CountDown2State createState() => _CountDown2State();
}

class _CountDown2State extends State<CountDown2> {
  int count = 0;
  _plusCount() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Build Called $count");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'CountDown App..',
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: RaisedButton(
        elevation: 10,
        shape: CircleBorder(),
        color: Colors.redAccent,
        padding: EdgeInsets.all(7),
        onPressed: () {
          _plusCount();
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
