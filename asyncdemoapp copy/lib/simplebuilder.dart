import 'package:flutter/material.dart';

import './utils/server.dart';

class SimpleBuilder extends StatefulWidget {
  @override
  _SimpleBuilderState createState() => _SimpleBuilderState();
}

class _SimpleBuilderState extends State<SimpleBuilder> {
  List list = [];
  getList() async {
    // List<String> list = ["Orange", "Mango", "Apple"];
    var map = await Server.callNews();
    print("Map is..... $map");
    setState(() {
      list = map["articles"];
    });

    print("Now List is $list");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Init State Call");
    getList();
  }

  @override
  Widget build(BuildContext context) {
    print("Build Called....$list");
    //List<String> fruits = getList();
    return Scaffold(
        appBar: AppBar(
          title: Text('Simple'),
        ),
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (parent, index) {
            print("Index is $index and List is ${list[index]["title"]}");
            return Card(
              child: ListTile(
                leading: Image.network(list[index] == null
                    ? "https://internetdevels.com/sites/default/files/public/blog_preview/404_page_cover.jpg"
                    : list[index]["urlToImage"]),
                title: Text(
                  list[index] == null ? "" : list[index]["title"],
                  style: TextStyle(fontSize: 25),
                ),
              ),
            );
          },
        ));
  }
}
