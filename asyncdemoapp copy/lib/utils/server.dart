import 'dart:convert' as json;

import 'package:http/http.dart' as http;

class Server {
  static callNews() async {
    const url =
        "http://newsapi.org/v2/top-headlines?country=in&apiKey=11f0dc28d8874be0bb82287cbcf26121";
    http.Response response = await http.get(url);
    var map = json.jsonDecode(response.body);
    return map;
  }
}
