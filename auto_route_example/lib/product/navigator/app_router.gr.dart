// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeView());
    },
    HomeDetailRoute.name: (routeData) {
      final args = routeData.argsAs<HomeDetailRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: HomeDetailView(key: args.key, url: args.url));
    },
    DashBoardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const DashBoardView());
    },
    UserFullRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyPageRouter());
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SettingsView());
    },
    UserRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const UserView());
    },
    UserDetailRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const UserDetailView());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: 'home'),
        RouteConfig(HomeDetailRoute.name, path: 'detail'),
        RouteConfig(DashBoardRoute.name, path: '/', children: [
          RouteConfig(UserFullRoute.name,
              path: 'userFullRoute',
              parent: DashBoardRoute.name,
              children: [
                RouteConfig('#redirect',
                    path: '',
                    parent: UserFullRoute.name,
                    redirectTo: 'userView',
                    fullMatch: true),
                RouteConfig(UserRoute.name,
                    path: 'userView', parent: UserFullRoute.name),
                RouteConfig(UserDetailRoute.name,
                    path: ':id', parent: UserFullRoute.name)
              ]),
          RouteConfig(SettingsRoute.name,
              path: 'settings', parent: DashBoardRoute.name)
        ])
      ];
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [HomeDetailView]
class HomeDetailRoute extends PageRouteInfo<HomeDetailRouteArgs> {
  HomeDetailRoute({Key? key, required String url})
      : super(HomeDetailRoute.name,
            path: 'detail', args: HomeDetailRouteArgs(key: key, url: url));

  static const String name = 'HomeDetailRoute';
}

class HomeDetailRouteArgs {
  const HomeDetailRouteArgs({this.key, required this.url});

  final Key? key;

  final String url;

  @override
  String toString() {
    return 'HomeDetailRouteArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [DashBoardView]
class DashBoardRoute extends PageRouteInfo<void> {
  const DashBoardRoute({List<PageRouteInfo>? children})
      : super(DashBoardRoute.name, path: '/', initialChildren: children);

  static const String name = 'DashBoardRoute';
}

/// generated route for
/// [EmptyPageRouter]
class UserFullRoute extends PageRouteInfo<void> {
  const UserFullRoute({List<PageRouteInfo>? children})
      : super(UserFullRoute.name,
            path: 'userFullRoute', initialChildren: children);

  static const String name = 'UserFullRoute';
}

/// generated route for
/// [SettingsView]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [UserView]
class UserRoute extends PageRouteInfo<void> {
  const UserRoute() : super(UserRoute.name, path: 'userView');

  static const String name = 'UserRoute';
}

/// generated route for
/// [UserDetailView]
class UserDetailRoute extends PageRouteInfo<void> {
  const UserDetailRoute() : super(UserDetailRoute.name, path: ':id');

  static const String name = 'UserDetailRoute';
}
