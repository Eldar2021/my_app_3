import 'package:flutter/material.dart';

class TwoScreen extends StatelessWidget {
  const TwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TwoScreen'),
      ),
      body: const Center(
        child: Text('TwoScreen'),
      ),
    );
  }
}
