import 'package:flutter/material.dart';

class UserDetailView extends StatelessWidget {
  const UserDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserDetailView'),
      ),
      body: const Center(
        child: Text('UserDetailView'),
      ),
    );
  }
}
