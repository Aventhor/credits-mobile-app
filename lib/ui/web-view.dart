import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatelessWidget {

  final String url;
  final String companyName;

  WebViewPage(this.url, this.companyName);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(companyName, style: TextStyle(color: Colors.white))
      ),
      url: url,
      withZoom: true,
      hidden: true,
      initialChild: Container(
        color: Color(0xffe9e9e9),
        child: Center(
          child: CircularProgressIndicator(),
      ),
      ),
    );
  }
}