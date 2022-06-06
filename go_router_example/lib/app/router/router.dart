import 'package:go_router/go_router.dart';
import 'package:go_router_example/app/router/is_false_router.dart';
import 'package:go_router_example/app/router/is_true_router.dart';
import 'package:go_router_example/auth/auth.dart';
import 'package:go_router_example/main_page/main_page.dart';

class AppRouter {
  AppRouter(this.authState);

  final AuthState authState;

  static const home = '/';

  late final router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => 
        authState is AuthSingin ? const MainPage() : const AuthPage(),
        routes: authState is AuthSingin ? IsTRoute.I.routes : IsFRoute.I.routes,
      ),
    ],
  );
}
