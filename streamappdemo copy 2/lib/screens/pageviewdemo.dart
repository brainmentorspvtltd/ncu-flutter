import 'package:flutter/material.dart';

import './pages/Page1.dart';
import './pages/Page2.dart';
import './pages/Page3.dart';

class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  PageController pageCtrl =
      PageController(initialPage: 0, viewportFraction: 0.90);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (currentPage){
          print(currentPage);
        },
        scrollDirection: Axis.horizontal,
        controller: pageCtrl,
        children: <Widget>[Page1(), Page2(), Page3()],
      ),
    );
  }
}
