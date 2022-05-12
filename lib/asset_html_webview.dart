import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart' as web_view;

class AssetHtmlWebView extends StatefulWidget {
  const AssetHtmlWebView({Key? key}) : super(key: key);

  @override
  State<AssetHtmlWebView> createState() => _AssetHtmlWebViewState();
}

class _AssetHtmlWebViewState extends State<AssetHtmlWebView> {
  late web_view.WebViewController _controller;

  Future<void> _loadLocalHtml() async {
    final html = await rootBundle.loadString('assets/use_case_1/index.html');

    final url = Uri.dataFromString(
      html,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString();

    _controller.loadUrl(url);
  }

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
    return web_view.WebView(
      javascriptMode: web_view.JavascriptMode.unrestricted,
      onWebViewCreated: (controller) {
        _controller = controller;
        _loadLocalHtml();
      },
    );
  }
}
