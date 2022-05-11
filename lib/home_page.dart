import 'package:flutter/material.dart';
import 'package:webview/basic_webview.dart';

import 'local_html_webview.dart';

enum Mode { basic, localHtml }

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.title,
    this.mode = Mode.localHtml,
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
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: widget),
    );
  }
}
