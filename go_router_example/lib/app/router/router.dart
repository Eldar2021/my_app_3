import 'package:go_router/go_router.dart';
import 'package:go_router_example/auth/auth.dart';
import 'package:go_router_example/counter/counter.dart';

class AppRouter {
  AppRouter(this.authState);

  final AuthState authState;

  late final router = GoRouter(
    initialLocation: authState is AuthSingin ? '/counter' : '/auth',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        path: '/counter',
        builder: (context, state) => const CounterPage(),
      ),
    ],
  );
}
