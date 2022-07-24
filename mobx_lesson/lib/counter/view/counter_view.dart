import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_lesson/counter/logic/counter_mobx.dart';

class CounterView extends StatelessWidget {
  CounterView({super.key});

  final counterMobx = CounterMobx();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterView'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Observer(builder: (_) {
              log('Icons');
              return Icon(
                counterMobx.isPositive ? Icons.thumb_up : Icons.thumb_down,
                color: counterMobx.isPositive ? Colors.green : Colors.red,
              );
            }),
          )
        ],
      ),
      body: Center(
        child: Observer(builder: (_) {
          log('Text');
          return Text('${counterMobx.count}');
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: counterMobx.increment,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: counterMobx.decrement,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
