import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example/dashboard/dashboard.dart';
import 'package:auto_route_example/dashboard/settings/settings.dart';
import 'package:auto_route_example/dashboard/user/user_detail_view.dart';
import 'package:auto_route_example/dashboard/user/user_view.dart';
import 'package:auto_route_example/home/home_detail_view.dart';
import 'package:auto_route_example/home/home_view.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeView, path: 'home'),
    AutoRoute(page: HomeDetailView, path: 'detail'),
    AutoRoute(
      page: DashBoardView,
      path: '/',
      initial: true,
      children: [
        AutoRoute(
          page: EmptyPageRouter,
          name: 'userFullRoute',
          path: 'userFullRoute',
          children: [
            AutoRoute(page: UserView, path: 'userView', initial: true),
            AutoRoute(page: UserDetailView, path: ':id'),
          ],
        ),
        AutoRoute(page: SettingsView, path: 'settings'),
      ],
    ),
  ],
)

// extend the generated private router
class AppRouter extends _$AppRouter {}

class EmptyPageRouter extends AutoRouter {
  const EmptyPageRouter({Key? key}) : super(key: key);
}
