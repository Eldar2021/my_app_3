import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example/product/navigator/app_router.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _image = 'https://picsum.photos/200';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
      ),
      body: IconButton(
        onPressed: () => context.router.navigate(
          HomeDetailRoute(url: _image),
        ),
        icon: Image.network(_image),
      ),
    );
  }
}
