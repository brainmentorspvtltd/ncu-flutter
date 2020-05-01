import 'package:flutter/material.dart';

class Animation3 extends StatefulWidget {
  @override
  _Animation3State createState() => _Animation3State();
}

class _Animation3State extends State<Animation3>
    with SingleTickerProviderStateMixin {
  Animation<Size> _animation;
  AnimationController _animationController;
  final url = '';
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<Size>(
      begin: Size(double.infinity, 0),
      end: Size(double.infinity, 300),
    ).animate(_animationController);
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
        title: Text('Animation with AnimatedBuilder'),
      ),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, ch) => Center(
            child: Container(
              height: _animation.value.height,
              width: _animation.value.height,
              color: Colors.green,
              child: ch,
            ),
          ),
          child: url.length > 0 ? Image.network(url) : FlutterLogo(),
        ),
      ),
    );
  }
}
