import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechDemo extends StatefulWidget {
  @override
  _SpeechDemoState createState() => _SpeechDemoState();
}

class _SpeechDemoState extends State<SpeechDemo> {
  var msg = '';
  FlutterTts fts = FlutterTts();
  textSpeak() async {
    await fts.setLanguage("hi-IN");
    await fts.setPitch(1); // 0 to 5
    await fts.speak('नमस्ते आप कैसे हैं');
  }

  void errorListener(SpeechRecognitionError error) {
    print("Error Listener $error");
    setState(() {
      msg = "${error.errorMsg} - ${error.permanent}";
    });
  }

  void statusListener(String status) {
    //changeStatusForStress(status);
    setState(() {
      msg = "$status";
    });
  }

  speakNow() async {
    SpeechToText speech = SpeechToText();

    bool available = await speech.initialize(
        onStatus: statusListener, onError: errorListener);
    print(".....................Avaliable is $available");
    if (available) {
      speech.listen(onResult: resultListener);
    } else {
      print("The user has denied the use of speech recognition.");
    }
    // some time later...
    Timer(Duration(seconds: 30), () {
      speech.stop();
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      msg = "${result.recognizedWords} - ${result.finalResult}";
      print("Result is $msg");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: <Widget>[
        Container(
          child: RaisedButton(
            onPressed: () {
              //speakNow();
              textSpeak();
            },
            child: Text('Speak Now'),
          ),
        ),
        Container(child: Text(msg))
      ])),
    );
  }
}
