import 'dart:convert' as json;
import 'dart:io';

import 'package:http/http.dart' as http;

import './urlconstants.dart';
import '../models/user.dart';

class Server {
  static doLogin(User user) async {
    //var jsonString = json.jsonEncode(user);
    //print("JSON String is $jsonString");
    print("NOW JSON STRING IS ${user.toJson()}");
    var jsonString = json.jsonEncode(user.toJson());
    print("JSON String is $jsonString");
    var map = await http.post(UrlConstants.LOGIN_URL,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonString);
    print('After Server Call');
    print(map.body);
    //print(map[]);
    return map;
  }
}
