import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home8Screen extends StatelessWidget {
  const Home8Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home8Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Home8Screen'),
            ElevatedButton(
              onPressed: () => context.go('/home9'),
              child: const Text('home9'),
            )
          ],
        ),
      ),
    );
  }
}
