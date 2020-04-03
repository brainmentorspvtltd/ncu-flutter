import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDemo extends StatelessWidget {
  Completer<WebViewController> ctrl = Completer<WebViewController>();
  _createWebView() {
    return WebView(
      initialUrl: 'http://brain-mentors.com',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController c) {
        ctrl.complete(c);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView Demo'),
      ),
      body: Container(
        child: _createWebView(),
      ),
    );
  }
}
