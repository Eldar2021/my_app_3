import 'package:flutter/material.dart';

class OneScreen extends StatelessWidget {
  const OneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OneScreen'),
      ),
      body: const Center(
        child: Text('OneScreen'),
      ),
    );
  }
}
