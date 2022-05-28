import 'package:flutter/material.dart';

import '../component/password_cubit.dart';
import '../component/password_state_ful.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('rebuild HomeScreen');
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: const [
            PasswordText(),
            SizedBox(height: 20),
            PasswordText1(),
          ],
        ),
      ),
    );
  }
}
