import 'dart:convert' as json;

import 'package:flutter/material.dart';

import './dashboard.dart';
import '../models/user.dart';
import '../utils/server.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _useridCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();
  _createStyle() {
    return TextStyle(fontSize: 30, color: Colors.yellowAccent);
  }

  _createUserid() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _useridCtrl,
        style: TextStyle(fontSize: 30),
        decoration: InputDecoration(
            hintText: 'Type Userid Here',
            hintStyle: _createStyle(),
            prefixIcon: Icon(
              Icons.person,
              size: 30,
              color: Colors.amberAccent,
            )),
      ),
    );
  }

  _createPwd() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _passwordCtrl,
        obscureText: true,
        style: TextStyle(fontSize: 30),
        decoration: InputDecoration(
            hintText: 'Type Password Here',
            hintStyle: _createStyle(),
            prefixIcon: Icon(
              Icons.more,
              size: 30,
              color: Colors.redAccent,
            )),
      ),
    );
  }

  String msg = '';
  _doLoginCall() {
    String userid = _useridCtrl.text;
    String password = _passwordCtrl.text;
    User user = new User();
    user.userid = userid;
    user.password = password;
    Future future = Server.doLogin(user);

    print("Map is $future");

    future.then((response) {
      var jsonString = response.body;
      var object = json.jsonDecode(jsonString);
      print(
          ":::::: Map is ${object['message']} and Type is ${object.runtimeType}");

      if (object['message'].contains('SuccessFully')) {
        Server.tokenId = object['tokenId'];
        Server.registerInterceptors();
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => DashBoard(object)));
      } else {
        print("Inside Else");
        setState(() {
          msg = 'Invalid Userid or Password';
        });
      }
    }).catchError((err) {
      setState(() {
        msg = 'Some Error Occur During Login Call';
        print(err);
      });
    });
  }

  _createLoginButton() {
    return Container(
      padding: EdgeInsets.all(10),
      child: MaterialButton(
        elevation: 5,
        minWidth: 200,
        padding: EdgeInsets.all(10),
        onPressed: () {
          _doLoginCall();
        },
        child: Text(
          'Login',
          style: TextStyle(fontSize: 30),
        ),
        color: Colors.tealAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    const logo =
        'https://www.logolynx.com/images/logolynx/17/17f5ca186cb13a65eea58598b66a1446.png';
    const url =
        'https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_960_720.jpg';
    return Scaffold(
      resizeToAvoidBottomPadding: false,
//      appBar: AppBar(
//        title: Text('Login'),
//      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(url, fit: BoxFit.cover),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  logo,
                  width: 100,
                  height: 100,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: media.height * 0.50,
                      width: media.width * 0.95,
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: media.height * 0.05,
                          ),
                          Text(
                            msg,
                            style: TextStyle(
                                fontSize: 30, color: Colors.tealAccent),
                          ),
                          _createUserid(),
                          _createPwd(),
                          _createLoginButton()
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
