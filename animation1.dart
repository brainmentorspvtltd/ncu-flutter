import 'package:flutter/material.dart';

class MyAnimations extends StatefulWidget {
  @override
  _MyAnimationsState createState() => _MyAnimationsState();
}

class _MyAnimationsState extends State<MyAnimations>
    with SingleTickerProviderStateMixin {
  Animation<Color> animation;

  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    // ColorTween -
    animation = ColorTween(begin: Colors.green, end: Colors.red)
        .animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animations'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            color: animation.value,
          ),
        ),
      ),
    );
  }
}
