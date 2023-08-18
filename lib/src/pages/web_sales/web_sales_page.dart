import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebSalesPage extends StatefulWidget {
  const WebSalesPage({super.key});

  @override
  State<WebSalesPage> createState() => _WebSalesPageState();
}

class _WebSalesPageState extends State<WebSalesPage> {
  var controller = WebViewController();

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://go.perfectpay.com.br/PPU38CMJ3OS'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      body: SafeArea(child: WebViewWidget(controller: controller)),
    );
  }
}
