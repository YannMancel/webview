import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart'
    as web_view_plus;

class AssetHtmlCssJsWebView extends StatefulWidget {
  const AssetHtmlCssJsWebView({Key? key}) : super(key: key);

  @override
  State<AssetHtmlCssJsWebView> createState() => _AssetHtmlCssJsWebViewState();
}

class _AssetHtmlCssJsWebViewState extends State<AssetHtmlCssJsWebView> {
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
      initialUrl: 'assets/use_case_2/index.html',
      onWebViewCreated: (controller) {
        _controller = controller;
      },
      javascriptChannels: <web_view_plus.JavascriptChannel>{
        web_view_plus.JavascriptChannel(
          name: 'JavascriptChannel',
          onMessageReceived: (javascriptMessage) async {
            await showDialog<void>(
              context: context,
              builder: (_) => AlertDialog(
                content: Text(javascriptMessage.message),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Ok'),
                  ),
                ],
              ),
            );
            _controller.webViewController.runJavascript('ok()');
          },
        ),
      },
    );
  }
}
