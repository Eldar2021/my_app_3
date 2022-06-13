import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home5Screen extends StatelessWidget {
  const Home5Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home5Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Home5Screen'),
            ElevatedButton(
              onPressed: () => context.go('/home6'),
              child: const Text('home6'),
            )
          ],
        ),
      ),
    );
  }
}
