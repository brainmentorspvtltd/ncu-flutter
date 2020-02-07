import 'package:flutter/material.dart';

import './screens/greetapp.dart';

void main() {
  print("Main call");
  runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.tealAccent,
      )
      //theme: ThemeData.dark()
      ,
      title: 'Count App',
      home: GreetApp()));
}

//void main() {
//  runApp(MaterialApp(
//    title: 'My First App',
//    home: SafeArea(
//        child: Container(
//      color: Colors.lightBlue,
//      child: Center(
//        child: Text(
//          'Hello Flutter',
//          style: TextStyle(fontSize: 20),
//        ),
//      ),
//    )),
//  ));
//}
