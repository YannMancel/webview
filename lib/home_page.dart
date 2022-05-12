import 'package:flutter/material.dart';
import 'package:webview/components/_components.dart';

enum Mode { basic, localHtml, assetHtml, assetHtmlCssJs }

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.title,
    this.mode = Mode.assetHtmlCssJs,
  }) : super(key: key);

  final String title;
  final Mode mode;

  @override
  Widget build(BuildContext context) {
    late Widget widget;
    switch (mode) {
      case Mode.basic:
        widget = const BasicWebView();
        break;
      case Mode.localHtml:
        widget = const LocalHtmlWebView();
        break;
      case Mode.assetHtml:
        widget = const AssetHtmlWebView();
        break;
      case Mode.assetHtmlCssJs:
        widget = const AssetHtmlCssJsWebView();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: widget),
    );
  }
}
