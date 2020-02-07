import 'package:flutter/material.dart';

class GreetApp extends StatefulWidget {
  @override
  _GreetAppState createState() => _GreetAppState();
}

class _GreetAppState extends State<GreetApp> {
  String _firstName;
  String _lastName;
  String _fullName;
//  String _initCap(String str) {
//    return str[0].toUpperCase() + str.substring(1).toLowerCase();
//  }

  final _initCap =
      (String str) => str[0].toUpperCase() + str.substring(1).toLowerCase();

  _printFullName() {
    setState(() {
      _fullName = _initCap(_firstName) + " " + _initCap(_lastName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Greet App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                onChanged: (str) {
                  _firstName = str;
                  //print(str);
                },
                decoration: InputDecoration(
                    helperText: 'First Name Only',
                    helperStyle:
                        TextStyle(fontSize: 20, color: Colors.redAccent),
                    prefixIcon: Icon(
                      Icons.supervised_user_circle,
                      size: 50,
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Type Name Here',
                    labelText: 'Enter Name Here'),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                onChanged: (str) {
                  _lastName = str;
                  // print(str);
                },
                decoration: InputDecoration(
                    helperText: 'Last Name Only',
                    helperStyle:
                        TextStyle(fontSize: 20, color: Colors.redAccent),
                    prefixIcon: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.teal,
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Type LastName Here',
                    labelText: 'Enter LastName Here'),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.lime,
                  onPressed: () {
                    _printFullName();
                  },
                  child: Text(
                    'Greet',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text(
                    'Clear',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Welcome ' + (_fullName ?? ""),
              style: TextStyle(fontSize: 40),
            )
          ],
        ),
      ),
    );
  }
}
