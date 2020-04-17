import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherDemo extends StatefulWidget {
  @override
  _UrlLauncherDemoState createState() => _UrlLauncherDemoState();
}

class _UrlLauncherDemoState extends State<UrlLauncherDemo> {
  makeACall() async {
    const url = 'tel:122344';
    if (await canLaunch(url)) {
      launch(url);
    }
  }

  showSlider() {
    return SizedBox(
      height: 250,
      width: 400,
      child: Carousel(
          images: [
            NetworkImage(
                'https://car-pictures-download.com/wp-content/uploads/2018/03/car-pictures-favicon-ferrari.png'),
            NetworkImage(
                'https://images.pexels.com/photos/210019/pexels-photo-210019.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
          ],
          animationDuration: Duration(seconds: 2),
          dotSize: 50,
          dotColor: Colors.black,
          autoplay: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          showSlider(),
          RaisedButton(
            onPressed: () {
              makeACall();
            },
            child: Text('Phone'),
          )
        ],
      )),
    );
  }
}
