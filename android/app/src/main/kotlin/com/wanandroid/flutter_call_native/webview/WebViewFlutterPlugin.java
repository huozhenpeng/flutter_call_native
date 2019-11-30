package com.wanandroid.flutter_call_native.webview;

import io.flutter.plugin.common.PluginRegistry;

public class WebViewFlutterPlugin {
    public static void registerWith(PluginRegistry registry)
    {
        //com.wanandroid.flutter_call_native.webview.WebViewFlutterPlugin
        final  String key= WebViewFlutterPlugin.class.getCanonicalName();
        if(registry.hasPlugin(key))
        {
            return;
        }
        PluginRegistry.Registrar registrar=registry.registrarFor(key);
        registrar.platformViewRegistry().registerViewFactory("webview",new WebViewFactory(registrar.messenger()));

    }
}
