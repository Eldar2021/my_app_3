import 'package:go_router/go_router.dart';
import 'package:go_router_example/auth/auth.dart';
import 'package:go_router_example/counter/counter.dart';
import 'package:go_router_example/post/views/post_detail.dart';
import 'package:go_router_example/post/views/posts_page.dart';

class AppRouter {
  AppRouter(this.authState);

  final AuthState authState;

  late final router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            authState is AuthSingin ? const CounterPage() : const AuthPage(),
      ),
      GoRoute(
        path: '/posts',
        builder: (context, state) => const PostsScreen(),
        routes: [
          GoRoute(
            path: ':post',
            builder: (context, state) => PostDetailScreen(
              post: state.params['post']!,
            ),
          ),
        ],
      ),
    ],
  );
}
