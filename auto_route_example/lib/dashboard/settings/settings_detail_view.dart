import 'package:flutter/material.dart';

class SettingsDetailView extends StatelessWidget {
  const SettingsDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingsDetailView'),
      ),
      body: const Center(
        child: Text('SettingsDetailView'),
      ),
    );
  }
}
