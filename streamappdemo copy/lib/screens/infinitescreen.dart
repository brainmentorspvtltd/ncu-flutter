import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/db.dart';

class InfiniteScreen extends StatefulWidget {
  @override
  _InfiniteScreenState createState() => _InfiniteScreenState();
}

class _InfiniteScreenState extends State<InfiniteScreen> {
  Future<List<DocumentSnapshot>> future;
  ScrollController sc = ScrollController();
  int records = 5;
  Db db = Db();
  _fetchNextData() {
    future = db.getPaginatedData(records);
  }

  getStyle() {
    return TextStyle(fontSize: 32);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sc.addListener((){
      if(sc.position.pixels==sc.position.maxScrollExtent){
        print("Reach to the End ");
        setState(() {
          _fetchNextData();
        });
      }
    });
    print("Inside Init State");
    _fetchNextData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite Screen'),
      ),
      body: FutureBuilder(
          future: this.future,
          builder: (BuildContext context, AsyncSnapshot snapShot) {
            if (snapShot.hasError) {
              return Center(
                  child:
                      Text('Error During fetching the data from the server'));
            }
            if (!snapShot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              controller: sc,
                itemExtent: 150,
                itemCount: snapShot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      snapShot.data[index]['name'],
                      style: getStyle(),
                    ),
                    subtitle: Text(
                      snapShot.data[index]['address'],
                      style: getStyle(),
                    ),
                  );
                });
          }),
    );
  }
}
