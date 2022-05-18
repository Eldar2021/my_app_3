import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

mixin WebViewMixin {
  JavascriptChannel toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      },
    );
  }
}
