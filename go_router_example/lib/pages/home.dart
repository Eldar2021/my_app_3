import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('HomeScreen'),
            ElevatedButton(
              onPressed: () => context.go('/home1'),
              child: const Text('home1'),
            )
          ],
        ),
      ),
    );
  }
}
