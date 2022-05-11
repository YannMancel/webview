import 'package:flutter/material.dart';
import 'package:webview/basic_webview_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: BasicWebViewWidget(),
      ),
    );
  }
}
