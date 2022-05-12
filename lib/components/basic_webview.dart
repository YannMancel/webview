import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart' as web_view;

class BasicWebView extends StatefulWidget {
  const BasicWebView({Key? key}) : super(key: key);

  @override
  State<BasicWebView> createState() => _BasicWebViewState();
}

class _BasicWebViewState extends State<BasicWebView> {
  late web_view.WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) {
      web_view.WebView.platform = web_view.AndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        web_view.WebView(
          javascriptMode: web_view.JavascriptMode.unrestricted,
          initialUrl: 'https://flutter.dev',
          onWebViewCreated: (controller) {
            _controller = controller;
          },
          onPageStarted: (url) => print('===> New website: $url'),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              onPressed: () {
                final currentPageUrl = _controller.currentUrl();
                print('===> Previous website: $currentPageUrl');

                _controller.loadUrl('https://youtube.com');
              },
              child: const Icon(Icons.send),
            ),
          ),
        )
      ],
    );
  }
}
