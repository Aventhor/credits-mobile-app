import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatelessWidget {

  final String url;

  WebViewPage(this.url);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text('Назад', style: TextStyle(color: Colors.white))
      ),
      url: url,
      withZoom: true,
      hidden: true,
      initialChild: Container(
        color: Color(0xffe9e9e9),
        child: Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff6fb165))
          ),
      ),
      ),
    );
  }
}