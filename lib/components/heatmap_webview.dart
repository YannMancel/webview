import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart'
    as web_view_plus;

class HeatmapWebView extends StatefulWidget {
  const HeatmapWebView({Key? key}) : super(key: key);

  @override
  State<HeatmapWebView> createState() => _HeatmapWebViewWebViewState();
}

class _HeatmapWebViewWebViewState extends State<HeatmapWebView> {
  late web_view_plus.WebViewPlusController _controller;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) {
      web_view_plus.WebViewPlus.platform = web_view_plus.AndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return web_view_plus.WebViewPlus(
      javascriptMode: web_view_plus.JavascriptMode.unrestricted,
      initialUrl: 'assets/use_case_3/index.html',
      onWebViewCreated: (controller) {
        _controller = controller;

        //_controller.webViewController.runJavascript('ok()');
      },
    );
  }
}
