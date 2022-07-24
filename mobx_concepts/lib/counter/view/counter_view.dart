import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_concepts/counter/logic/counter_mobx.dart';

final CounterMobx counterMobx = CounterMobx();

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterView'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Observer(builder: (_) {
              log('isPositive');
              return Icon(
                counterMobx.isPositive ? Icons.thumb_up : Icons.thumb_down,
              );
            }),
          )
        ],
      ),
      body: Center(
        child: Observer(builder: (_) {
          log('count');
          return Text(counterMobx.count.toString());
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: counterMobx.increment,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: counterMobx.decrement,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
