import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var show = RaisedButton(
  onPressed: () {
    IaToast.show(msg: "hello Flutter", type: Toast.LENGTH_LONG);//使用吐司
  },
  child: Text("点击弹吐司"),
);

var app = MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home: Scaffold(
    appBar: AppBar(
      title: Text('Flutter之旅'),
    ),
    body: show,
  ),
);

void main() => runApp(app);

///吐司类型 [LENGTH_SHORT]短时间,[LENGTH_LONG]长时间
enum Toast {
  LENGTH_SHORT,
  LENGTH_LONG
}

///吐司类
class IaToast {
  static const MethodChannel _channel =//方法渠道名
  const MethodChannel('show_toast');

  static show(//静态方法显示吐司
          {String msg, Toast type = Toast.LENGTH_SHORT}) {
    if (type == Toast.LENGTH_SHORT) {
      _channel.invokeMethod('showToast', {//渠道对象调用方法
        "msg": msg,
        "type": 0,
      });
    } else {
      _channel.invokeMethod('showToast', {
        "msg": msg,
        "type": 1,
      });
    }
  }
}
