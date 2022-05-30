import 'package:flutter/material.dart';

class ElevationScreen extends StatelessWidget {
  const ElevationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ElevationScreen'),
      ),
      body: const Center(
        child: Text('ElevationScreen'),
      ),
    );
  }
}
