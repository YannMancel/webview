import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview/_features.dart';
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
    return FutureBuilder(
      future: const HeatmapLogic().createHeatmapFromAssets(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final result = snapshot.data as HeatmapData;
          final data = result.convertPoints3dToJs;
          final radius = result.radius;
          final blur = result.blur;
          final gradient = result.convertGradientToJs;
          final max = result.max;
          final command = 'setupData($data,$radius,$blur,$gradient,$max)';

          return web_view_plus.WebViewPlus(
            javascriptMode: web_view_plus.JavascriptMode.unrestricted,
            initialUrl: 'assets/use_case_3/index.html',
            onWebViewCreated: (controller) {
              _controller = controller;
            },
            javascriptChannels: <web_view_plus.JavascriptChannel>{
              web_view_plus.JavascriptChannel(
                name: 'JavascriptChannel',
                onMessageReceived: (javascriptMessage) async {
                  if (javascriptMessage.message == 'DOM is ready') {
                    _controller.webViewController.runJavascript(command);
                  }
                },
              ),
            },
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        }

        return const CircularProgressIndicator.adaptive();
      },
    );
  }
}
