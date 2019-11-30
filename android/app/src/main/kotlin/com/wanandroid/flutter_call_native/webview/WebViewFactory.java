package com.wanandroid.flutter_call_native.webview;

import android.content.Context;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class WebViewFactory extends PlatformViewFactory {
    private  final  BinaryMessenger messenger;
    public WebViewFactory(BinaryMessenger messenger) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger=messenger;

    }

    @Override
    public PlatformView create(Context context, int id, Object args) {
        //点击flutter中按钮的时候，会回调
        Map<String, Object> params = (Map<String, Object>) args;
        return new MWebView(context, messenger, id, params);
    }
}
