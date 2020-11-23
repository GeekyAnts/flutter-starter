import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDetails extends StatefulWidget {
  final String url;
  WebViewDetails({this.url});
  @override
  _WebViewDetailsState createState() => _WebViewDetailsState();
}

class _WebViewDetailsState extends State<WebViewDetails> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  num _stackToView = 1;

  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
      index: _stackToView,
      children: [
        Column(
          children: <Widget>[
            Expanded(
                child: WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: _handleLoad,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
            )),
          ],
        ),
        Container(
            child: Center(
          child: CircularProgressIndicator(),
        )),
      ],
    ));
  }
}
