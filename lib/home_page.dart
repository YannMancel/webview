import 'package:flutter/material.dart';
import 'package:webview/_features.dart';

enum Mode { basic, localHtml, assetHtml, assetHtmlCssJs, heatmap }

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.title,
    this.mode = Mode.heatmap,
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
      case Mode.heatmap:
        widget = Stack(
          fit: StackFit.expand,
          children: const <Widget>[
            ColoredBox(color: Colors.grey),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: AspectRatio(
                  aspectRatio: 16.0 / 10.4,
                  child: HeatmapWebView(),
                ),
              ),
            ),
          ],
        );
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
