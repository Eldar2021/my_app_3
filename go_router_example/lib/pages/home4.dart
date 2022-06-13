import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home4Screen extends StatelessWidget {
  const Home4Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home4Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Home4Screen'),
            ElevatedButton(
              onPressed: () => context.go('/home5'),
              child: const Text('home5'),
            )
          ],
        ),
      ),
    );
  }
}
