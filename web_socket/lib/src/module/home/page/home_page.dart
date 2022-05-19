import 'dart:async';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

const String testSocketWebSite = 'https://www.piesocket.com/websocket-tester#';
const String testSocketUrl =
    'wss://demo.piesocket.com/v3/channel_1?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Stream stream;
  final _channel = IOWebSocketChannel.connect(Uri.parse(testSocketUrl));

  @override
  void initState() {
    stream = _channel.stream.asBroadcastStream();
    super.initState();
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<dynamic>(
        stream: _channel.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('massage ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return Center(child: Text('data is ${snapshot.data}'));
          }
          return const Center(child: Text('some error'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
