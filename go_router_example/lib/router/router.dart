import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/home.dart';
import '../pages/home1.dart';
import '../pages/home2.dart';
import '../pages/home3.dart';
import '../pages/home4.dart';
import '../pages/home5.dart';
import '../pages/home6.dart';
import '../pages/home7.dart';
import '../pages/home8.dart';
import '../pages/home9.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/home1',
      builder: (BuildContext context, GoRouterState state) => const Home1Screen(),
    ),
    GoRoute(
      path: '/home2',
      builder: (BuildContext context, GoRouterState state) => const Home2Screen(),
    ),
    GoRoute(
      path: '/home3',
      builder: (BuildContext context, GoRouterState state) => const Home3Screen(),
    ),
    GoRoute(
      path: '/home4',
      builder: (BuildContext context, GoRouterState state) => const Home4Screen(),
    ),
    GoRoute(
      path: '/home5',
      builder: (BuildContext context, GoRouterState state) => const Home5Screen(),
    ),
    GoRoute(
      path: '/home6',
      builder: (BuildContext context, GoRouterState state) => const Home6Screen(),
    ),
    GoRoute(
      path: '/home7',
      builder: (BuildContext context, GoRouterState state) => const Home7Screen(),
    ),
    GoRoute(
      path: '/home8',
      builder: (BuildContext context, GoRouterState state) => const Home8Screen(),
    ),
    GoRoute(
      path: '/home9',
      builder: (BuildContext context, GoRouterState state) => const Home9Screen(),
    ),
  ],
);
