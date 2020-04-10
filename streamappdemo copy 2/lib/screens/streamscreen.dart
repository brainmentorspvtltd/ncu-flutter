import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/db.dart';

class StreamScreen extends StatefulWidget {
  @override
  _StreamScreenState createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  Db db = Db();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Demo'),
      ),
      body: StreamBuilder(
        stream: db.getAllRecordsSnapShot(), // Stream of Data
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // GUI
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error During Fetch from FireBase',
                style: TextStyle(fontSize: 16),
              ),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            children: snapshot.data.documents.map((document) {
              return ListTile(
                title: Text(document['name']),
                subtitle: Text(document['address']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
