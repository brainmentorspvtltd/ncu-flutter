import 'dart:convert' as json;
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

import './urlconstants.dart';
import '../interceptors/TokenInterceptor.dart';
import '../models/user.dart';

class Server {
  static var client = http.Client();
  static String tokenId;
  static registerInterceptors() {
    client = HttpClientWithInterceptor.build(interceptors: [
      TokenInterceptor(tokenId),
    ]);
    print("Registered.......");
  }

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

  static getAllTest(String tokenId) async {
    //var result = await http.get(UrlConstants.ALL_TEST + "?tokenId=" + tokenId);
    var result = null;
    try {
      result = await client.get(UrlConstants.ALL_TEST);
    } catch (err) {
      print("Error is $err");
    }
    return result;
  }

  static getAllStudents(String tokenId) async {
    var result = await client.get(UrlConstants.ALL_STUDENTS);
//    var result = await http
//        .get(UrlConstants.ALL_STUDENTS, headers: {'AUTH-TOKEN': tokenId});
    return result;
  }
}
