import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DashBoard extends StatefulWidget {
  String name;
  String photoUrl;
  DashBoard(String name, String photoUrl) {
    this.name = name;
    this.photoUrl = photoUrl;
  }
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  ChewieController _chewieController;
  VideoPlayerController _videoPlayerController;
  String url =
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';

  _createSnackBar() {
    return SnackBar(
      content: Text('Welcome in the DashBoard Page, enjoy videos'),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
      action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            print("U CLick on Snack Bar OK");
          }),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.network(url);
    _chewieController = ChewieController(
        looping: true,
        aspectRatio: 16 / 9,
        autoInitialize: true,
        videoPlayerController: _videoPlayerController,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: TextStyle(fontSize: 30),
            ),
          );
        });
    Timer timer = Timer(Duration(seconds: 5), () {
      print("Key is $key");
      print("State is ${key.currentState}");
      key.currentState.showSnackBar(_createSnackBar());
    });
  }

  _createDrawerHeader() {
    return DrawerHeader(
      child: Column(
        children: <Widget>[
          CircleAvatar(
            minRadius: 20,
            maxRadius: 20,
            backgroundImage: NetworkImage(widget.photoUrl),
          ),
          Text(
            'Welcome ' + widget.name,
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 20, spreadRadius: 10)
        ],
        gradient: LinearGradient(
            colors: [Colors.lightGreenAccent, Colors.grey],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
    );
  }

  _createDrawerBody(String heading) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {},
        child: ExpansionTile(
          title: Text(
            heading,
            style: TextStyle(fontSize: 20),
          ),
          children: <Widget>[Text('Photos'), Text('Videos'), Text('History')],
        ),
        splashColor: Colors.orange,
      ),
    );
  }

  _createDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _createDrawerHeader(),
          _createDrawerBody('Chat'),
          _createDrawerBody('Profile'),
          _createDrawerBody('Orders')
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      drawer: _createDrawer(),
      appBar: AppBar(
        title: Text('Welcome ${widget.name}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Chewie(
              controller: _chewieController,
            ),
            SizedBox(
              height: 10,
            ),
//            RaisedButton(
//              onPressed: () {
//                key.currentState.showSnackBar(_createSnackBar());
//              },
//              child: Text('Show SnackBar'),
//            )
          ],
        ),
      ),
    );
  }
}
