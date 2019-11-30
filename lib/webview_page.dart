import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WebViewPage extends StatelessWidget
{
  final String url;
  WebViewPage(this.url);
  @override
  Widget build(BuildContext context) {
    //Platform.isAndroid
    return Scaffold(
      appBar: AppBar(
        title: Text("这里显示的是原生的WebView"),
      ),
      body: Container(
        child: AndroidView(
            viewType: "webview",
          creationParams: {
              "url":url
          },
          creationParamsCodec: StandardMessageCodec(),
        ),
      ),
    );
  }

}