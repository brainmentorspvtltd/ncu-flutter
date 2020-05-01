import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraDemo extends StatefulWidget {
  @override
  _CameraDemoState createState() => _CameraDemoState();
}

class _CameraDemoState extends State<CameraDemo> {
  File image;
  openCamera() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      this.image = image;
    });
  }

  openGallery() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      this.image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Camera Open'),
              onPressed: () {
                openCamera();
              },
            ),
            RaisedButton(
              child: Text('Gallery Open'),
              onPressed: () {
                openGallery();
              },
            ),
            image == null
                ? Container(
                    child: Text(
                      'No Image',
                      style: TextStyle(fontSize: 30),
                    ),
                  )
                : Image.file(
                    image,
                    height: media.height * 0.40,
                    width: media.width * 0.40,
                  )
          ],
        ),
      ),
    );
  }
}
