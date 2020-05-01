import 'package:flutter/material.dart';

class Animation7 extends StatefulWidget {
  @override
  _Animation7State createState() => _Animation7State();
}

class _Animation7State extends State<Animation7>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: 20,
        ))
      ..addListener(() {
        setState(() {

        });
      });
    _animation = Tween<double>(
      begin: 0,
      end: 100000,
    ).animate(_animationController);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: Text('${_animation.value.toStringAsFixed(2)}'),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text(_animationController.status == AnimationStatus.completed
                  ? 'By a Audi'
                  : 'Win Lottery'),
              onPressed: _runAnimation,
            ),
          ],
        ),
      ),
    );

  }
  void _runAnimation(){
    if(_animationController.status == AnimationStatus.completed){
      _animationController.reverse();
    }
    else{
      _animationController.forward();
    }
  }
}
