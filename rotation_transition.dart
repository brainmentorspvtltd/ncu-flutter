import 'package:flutter/material.dart';

class RotationTransitionDemo extends StatefulWidget {
  @override
  _RotationTransitionDemoState createState() => _RotationTransitionDemoState();
}

class _RotationTransitionDemoState extends State<RotationTransitionDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: RotationTransition(
            child: Image.network(
                'https://pngimg.com/uploads/deadpool/deadpool_PNG73.png'),
            turns: _animationController,
          ),
        ),
      ),
    );
  }
}
