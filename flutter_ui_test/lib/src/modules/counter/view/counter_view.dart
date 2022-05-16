import 'package:flutter/material.dart';
import 'package:flutter_ui_test/src/constants/string/app_string.dart';

import '../../../src.dart';

class CounterView extends StatefulWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tooltip = AppToolTip.instance;
    final string = AppString.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text(string.cAppBar),
      ),
      body: Center(
        child: Text('${string.cCount} $_count'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: tooltip.addButton,
        onPressed: _increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
