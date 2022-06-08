import 'package:flutter/material.dart';

import '../views/home_view.dart';
import '../views/login.dart';
import '../views/signup.dart';
import '../views/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routes = <String, WidgetBuilder>{
      "/login": (BuildContext context) => const Login(),
      "/dashboard": (BuildContext context) => const Dashboard(),
      "/signup": (BuildContext context) => const Signup(),
    };
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        //primaryColor: const Color.fromARGB(255, 249, 0, 0),
        useMaterial3: false,
      ),
      routes: routes,
      home: const Splash(),
    );
  }
}
