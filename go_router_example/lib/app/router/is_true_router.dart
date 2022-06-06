import 'package:go_router/go_router.dart';
import 'package:go_router_example/post/views/post_detail.dart';
import 'package:go_router_example/post/views/posts_page.dart';

class IsTRoute {
  IsTRoute._init();

  static IsTRoute? _instance;
  // ignore: prefer_constructors_over_static_methods
  static IsTRoute get I {
    _instance ??= IsTRoute._init();
    return _instance!;
  }

  final List<GoRoute> routes = [
    GoRoute(
      path: 'posts',
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
  ];
}
