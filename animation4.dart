import 'package:flutter/material.dart';

class Animation4 extends StatefulWidget {
  @override
  _Animation4State createState() => _Animation4State();
}

class _Animation4State extends State<Animation4>
    with SingleTickerProviderStateMixin {
  //define an animation controller
  AnimationController _animationController;

  //define an animation
  Animation<double> _animation;
  Animation<double> _animationRadius;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
//    _animation =
//        Tween<double>(begin: 0, end: 200).animate(_animationController)
//    ..addListener(() {
//      setState(() {});
//    })
//    ..addStatusListener((status) {
//      if(status == AnimationStatus.completed){
//        _animationController.reverse();
//      }
//      if(status == AnimationStatus.dismissed){
//        _animationController.forward();
//      }
//
//    });
    _animationRadius =
        Tween<double>(begin: 0, end: 50).animate(_animationController)
    ..addListener(() {setState(() {

    });})..addStatusListener((status) {
          if(status == AnimationStatus.completed){
            _animationController.reverse();
          }
          if(status == AnimationStatus.dismissed){
            _animationController.forward();
          }
        });

    _animationController.forward();
    //now create an animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
//          height: _animation.value,
//          width: _animation.value,
        height: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_animationRadius.value),
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
