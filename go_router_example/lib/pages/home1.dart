import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home1Screen extends StatelessWidget {
  const Home1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home1Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Home1Screen'),
            ElevatedButton(
              onPressed: () => context.go('/home2'),
              child: const Text('home2'),
            )
          ],
        ),
      ),
    );
  }
}
