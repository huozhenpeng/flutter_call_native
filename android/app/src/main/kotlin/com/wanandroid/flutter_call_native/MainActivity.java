package com.wanandroid.flutter_call_native;

import android.content.Context;
import android.os.Bundle;
import android.widget.Toast;

import com.wanandroid.flutter_call_native.webview.WebViewFlutterPlugin;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "show_toast";//渠道名
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        WebViewFlutterPlugin.registerWith(this);
        MethodChannel channel = new MethodChannel(getFlutterView(), CHANNEL);//获取渠道
        channel.setMethodCallHandler(this::handleMethod);//设置方法监听
    }
    /**
     * 处理方法回调监听
     * @param methodCall 方法的参数相关
     * @param result 方法的返回值相关
     */
    private void handleMethod(MethodCall methodCall, MethodChannel.Result result) {
        switch (methodCall.method){//根据方法名进行处理
            case "showToast":
                handleToast(this,methodCall);//具体处理
                break;
            default:
                result.notImplemented();
        }
    }

    public static void handleToast(Context context, MethodCall methodCall) {
        String msg=methodCall.argument("msg");
        int type=methodCall.argument("type");
        Toast.makeText(context, msg, type).show();
    }
}