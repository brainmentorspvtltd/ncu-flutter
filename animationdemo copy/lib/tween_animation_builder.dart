import 'dart:math' as math;
import 'package:flutter/material.dart';

class TweenAnimationBuilderDemo extends StatefulWidget {
  @override
  _TweenAnimationBuilderDemoState createState() =>
      _TweenAnimationBuilderDemoState();
}

class _TweenAnimationBuilderDemoState extends State<TweenAnimationBuilderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'images/starbackground.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            Center(
              child: TweenAnimationBuilder(
                duration: Duration(seconds: 2),
                tween: Tween<double>(begin: 0, end: 2 * math.pi),
                builder: (_, double angle, __) {
                  return Transform.rotate(
                    angle: angle,
                    child: ColorFiltered(
                      child: Image.asset('images/ear.png'),
                      colorFilter: ColorFilter.mode(Colors.orange, BlendMode.modulate),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
