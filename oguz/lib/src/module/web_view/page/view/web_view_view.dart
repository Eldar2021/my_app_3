import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oguz/src/constant/lotties/lotties.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../src.dart';

class WebViewView extends StatelessWidget {
  const WebViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WebViewCubit, bool>(
        builder: (context, state) {
          if (state == true) {
            return const WebViewScreen();
          } else {
            final lottie = AppLottie.instance;
            return Center(
              child: Lottie.asset(lottie.desConnected),
            );
          }
        },
      ),
    );
  }
}

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({
    Key? key,
    this.cookieManager,
  }) : super(key: key);

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
    } else if (Platform.isIOS) {
      WebView.platform = CupertinoWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        title: const Text('Akriwall'),
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
