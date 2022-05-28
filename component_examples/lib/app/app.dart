import 'package:flutter/material.dart';

import '../home/infinity_random_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.deepOrange,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
      ),
      // home: const HomeScreen(),
      home: const RandomWords(),
    );
  }
}
