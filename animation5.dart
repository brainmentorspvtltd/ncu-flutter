import 'package:flutter/material.dart';

//create animation with the help of AnimatedWidget

class Animation5 extends StatefulWidget {
  @override
  _Animation5State createState() => _Animation5State();
}

class _Animation5State extends State<Animation5>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 300,
    ).animate(_animationController)

    ..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _animationController.reverse();
      }
      if(status == AnimationStatus.dismissed){
        _animationController.forward();
      }
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: MyLogo(animation: _animation,),
        ),
      ),
    );
  }
}
//to use setState is not a good idea
//create animation with by using animatedWidget
class MyLogo extends AnimatedWidget {
  MyLogo({
    @required Animation<double> animation,
}):super(listenable:animation);
  @override
  Widget build(BuildContext context) {
    final animation = super.listenable as Animation<double>;
    return Container(
      height: animation.value,
      width: animation.value,
      color: Colors.deepPurple,
    );
  }
}
