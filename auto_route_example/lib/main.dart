import 'package:auto_route_example/product/navigator/app_router.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();
    return MaterialApp.router(
      theme: ThemeData(useMaterial3: true),
      routeInformationParser: router.defaultRouteParser(),
      title: 'Material App',
      routerDelegate: router.delegate(),
    );
  }
}
