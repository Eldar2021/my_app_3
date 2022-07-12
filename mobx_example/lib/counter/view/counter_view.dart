import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../counter.dart';

class CounterView extends StatelessWidget {
  CounterView({super.key});
  final counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterView'),
      ),
      body: Center(
        child: Observer(
          builder: (context) => Text('${counter.value}'),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: counter.increment,
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: counter.decrement,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
