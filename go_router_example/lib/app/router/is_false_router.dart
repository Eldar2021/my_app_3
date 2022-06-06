import 'package:go_router/go_router.dart';

class IsFRoute {
  IsFRoute._init();

  static IsFRoute? _instance;
  // ignore: prefer_constructors_over_static_methods
  static IsFRoute get I {
    _instance ??= IsFRoute._init();
    return _instance!;
  }

  final List<GoRoute> routes = [];
}
