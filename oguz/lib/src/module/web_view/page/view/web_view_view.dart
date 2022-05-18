import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oguz/src/module/module.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key, this.cookieManager}) : super(key: key);

  final CookieManager? cookieManager;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> with WebViewMixin {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Flutter WebView example'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        actions: <Widget>[
          NavigationControls(_controller.future),
        ],
      ),
      body: WebView(
        initialUrl: 'https://www.arkiwall.com/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onProgress: (int progress) {
          debugPrint('WebView is loading (progress : $progress%)');
        },
        javascriptChannels: <JavascriptChannel>{
          toasterJavascriptChannel(context),
        },
        // navigationDelegate: (NavigationRequest request) {
        //   if (request.url.startsWith('https://www.arkiwall.com/')) {
        //     debugPrint('blocking navigation to $request}');
        //     return NavigationDecision.prevent;
        //   }
        //   debugPrint('allowing navigation to $request');
        //   return NavigationDecision.navigate;
        // },
        onPageStarted: (String url) {
          debugPrint('Page started loading: $url');
        },
        onPageFinished: (String url) {
          debugPrint('Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
        backgroundColor: const Color(0x00000000),
      ),
    );
  }
}
