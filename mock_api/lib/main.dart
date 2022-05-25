
import 'package:flutter/material.dart';
import 'package:mock_api/flow.dart';

import 'locator.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // home: MyHomePage(repo: sl<ModelRepository>()),
      home: const FlowApp(),
    );
  }
}
