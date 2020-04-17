import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:geolocator/geolocator.dart';

class GpsDemo extends StatefulWidget {
  @override
  _GpsDemoState createState() => _GpsDemoState();
}

class _GpsDemoState extends State<GpsDemo> {
  String locationDetails = "";
  getLocation() async {
    print("Get Location call");
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      locationDetails =
          "Lat is ${position.latitude} and Lng ${position.longitude}";
      print("Location is $locationDetails");
    });
  }

  FlutterTts tts = FlutterTts();
  speakNow() async {
    print("Speak Now Called...");
    bool result = await this.tts.isLanguageAvailable('hi-IN');
    print("Result is $result");
    //await tts.setLanguage("hi-IN");

    await tts.setLanguage("en-US");
    await tts.setPitch(1);
    await tts.speak("Hello How are You");
    //await tts.speak("नमस्ते");
    tts.setCompletionHandler((){
      print("Speech Done");
    });
    tts.setErrorHandler((err) {
      print("Some Error Occur $err");
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Get Location'),
            onPressed: () {
              getLocation();
            },
          ),
          Text(
            locationDetails,
            style: TextStyle(fontSize: 32),
          ),
          RaisedButton(
            onPressed: () {
              speakNow();
            },
            child: Text('Speak Now'),
          )
        ],
      )),
    );
  }
}
