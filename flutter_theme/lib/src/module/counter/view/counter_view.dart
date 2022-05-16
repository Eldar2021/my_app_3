import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  const CounterView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int _counter = 0;
  bool _isSelected = false;

  void _incrementCounter(bool val) {
    setState(() {
      _isSelected = !_isSelected;
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ChoiceChip(
              label: const Text('Click'),
              selected: _isSelected,
              onSelected: _incrementCounter,
            )
          ],
        ),
      ),
    );
  }
}
