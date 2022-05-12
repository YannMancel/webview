import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart' as web_view;

const _kHtml = '''<!DOCTYPE html>
<html>
<body>

<h1>This is heading 1</h1>
<h2>This is heading 2</h2>
<h3>This is heading 3</h3>
<h4>This is heading 4</h4>
<h5>This is heading 5</h5>
<h6>This is heading 6</h6>

</body>
</html>''';

class LocalHtmlWebView extends StatefulWidget {
  const LocalHtmlWebView({Key? key}) : super(key: key);

  @override
  State<LocalHtmlWebView> createState() => _LocalHtmlWebViewState();
}

class _LocalHtmlWebViewState extends State<LocalHtmlWebView> {
  late web_view.WebViewController _controller;

  Future<void> _loadLocalHtml() async {
    final url = Uri.dataFromString(
      _kHtml,
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
