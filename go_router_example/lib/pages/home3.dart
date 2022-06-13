import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home3Screen extends StatelessWidget {
  const Home3Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home3Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Home3Screen'),
            ElevatedButton(
              onPressed: () => context.go('/home4'),
              child: const Text('home4'),
            )
          ],
        ),
      ),
    );
  }
}
