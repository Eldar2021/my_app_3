import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home7Screen extends StatelessWidget {
  const Home7Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home7Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Home7Screen'),
            ElevatedButton(
              onPressed: () => context.go('/home8'),
              child: const Text('home8'),
            )
          ],
        ),
      ),
    );
  }
}
