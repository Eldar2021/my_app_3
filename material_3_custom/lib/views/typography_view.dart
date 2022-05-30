import 'package:flutter/material.dart';

class TypograpScreen extends StatelessWidget {
  const TypograpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DisplayLarge',
            style: textTheme.displayLarge,
          ),
          Text(
            'DisplayMedium',
            style: textTheme.displayMedium,
          ),
          Text(
            'DisplaySmall',
            style: textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
