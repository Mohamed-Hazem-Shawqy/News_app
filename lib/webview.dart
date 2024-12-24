import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatefulWidget {
  final String url;
  const Webview({
    super.key,
    required this.url,
  });

  @override
  State<Webview> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Web view'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
