import 'package:flutter/material.dart';

class BuildSnackBar extends StatelessWidget {
  Function _function;
  BuildSnackBar(Function function) {
    _function = function;
  }

  createSnackBar(context, String data) {
    var snackBar = new SnackBar(
      duration: Duration(seconds: 3),
      backgroundColor: Colors.orange,
      //content: Text('Record Added'),
      content: Row(
        children: <Widget>[Text(data), Icon(Icons.message)],
      ),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          elevation: 4,
          color: Colors.green,
          child: Text(
            'Add',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
            Future future = _function();
            future
                .then((data) => {createSnackBar(context, data)})
                .catchError((err) => createSnackBar(context, err));
          }),
    );
  }
}
