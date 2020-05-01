import 'package:flutter/material.dart';

class SizeAnimation extends StatefulWidget {
  @override
  _SizeAnimationState createState() => _SizeAnimationState();
}

class _SizeAnimationState extends State<SizeAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    //add duration of animation to Animation Controller
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    //create an animation
    _animation = Tween<double>(
      begin: 0.0,
      end: 300.0,
    ).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size Animation'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: _animation.value,
            height: _animation.value,
            color: Colors.green,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
