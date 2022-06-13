import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home9Screen extends StatelessWidget {
  const Home9Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home9Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Home9Screen'),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('home'),
            )
          ],
        ),
      ),
    );
  }
}
