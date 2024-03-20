import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  const WebView({required this.url, super.key});

  final String url;

  @override
  State<StatefulWidget> createState() => _WebView();
}

class _WebView extends State<WebView> {
  bool isLoading = true;
  late WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(onPageFinished: (finish) {
        setState(() {
          isLoading = false;
        });
      }))
      ..loadRequest(Uri.parse(widget.url))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : WebViewWidget(controller: webViewController);
  }
}
