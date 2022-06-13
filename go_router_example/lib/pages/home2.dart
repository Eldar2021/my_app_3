import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home2Screen extends StatelessWidget {
  const Home2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home2Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Home2Screen'),
            ElevatedButton(
              onPressed: () => context.go('/home3'),
              child: const Text('home3'),
            )
          ],
        ),
      ),
    );
  }
}
