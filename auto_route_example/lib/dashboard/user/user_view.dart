import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example/product/navigator/app_router.dart';
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserView'),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => context.router.navigate(const UserDetailRoute()),
            child: Card(
              child: Image.network('https://picsum.photos/200/300'),
            ),
          );
        },
      ),
    );
  }
}
