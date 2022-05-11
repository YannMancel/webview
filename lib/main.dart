import 'package:flutter/material.dart';
import 'package:webview/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebView',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(title: 'WebView'),
    );
  }
}
