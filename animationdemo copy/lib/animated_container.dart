import 'package:flutter/material.dart';
class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  bool _bigger=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: 1),
              height: _bigger ? 300: 100,
              width: _bigger ? 200: 100,
              color: Colors.red,

            ),
            SizedBox(height: 30,),
            RaisedButton(
              child: Text('Change Size'),
              onPressed: (){
                setState(() {
                  _bigger = !_bigger;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
