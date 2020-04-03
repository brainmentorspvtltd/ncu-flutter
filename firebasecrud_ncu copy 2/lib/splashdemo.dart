import 'dart:async';

import 'package:flutter/material.dart';

import './login.dart';

class SplashDemo extends StatefulWidget {
  @override
  _SplashDemoState createState() => _SplashDemoState();
}

class _SplashDemoState extends State<SplashDemo> {
  String url = "https://sportzwiki.com/wp-content/uploads/2018/09/The-Rock.jpg";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 7), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                // boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
                gradient: LinearGradient(colors: [
              Colors.tealAccent,
              Colors.deepOrange,
              Colors.yellowAccent
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            //color:Colors.tealAccent,
            width: mediaQuery.width,
            height: mediaQuery.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    maxRadius: 200,
                    backgroundImage: NetworkImage(url),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Loading...',
                    style: TextStyle(fontSize: 30),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
