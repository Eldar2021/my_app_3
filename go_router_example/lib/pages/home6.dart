import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home6Screen extends StatelessWidget {
  const Home6Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home6Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Home6Screen'),
            ElevatedButton(
              onPressed: () => context.go('/home7'),
              child: const Text('home7'),
            )
          ],
        ),
      ),
    );
  }
}
