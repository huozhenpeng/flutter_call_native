import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_call_native/webview_page.dart';

void main(){
  //debugPaintSizeEnabled=true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MethodChannel channel=const MethodChannel("show_toast");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("flutter 调用原生view"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("使用原生toast"),
                  onPressed: (){
                  channel.invokeMethod("showToast",{"msg":"这是flutter Toast","type":0});
              }),
              Builder(builder: (context){
                return Container(
                    margin: EdgeInsets.only(top: 20),
                    child:  RaisedButton(
                      child: Text("使用原生WebView"),
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context)
                              {
                                return WebViewPage("https://www.wanandroid.com/blog/show/2030");
                              }
                        ));

                      },
                    )
                );
              })

            ],
          ),
        ),
      ),
    );
  }
}


