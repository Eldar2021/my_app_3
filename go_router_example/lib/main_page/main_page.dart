import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_example/counter/view/counter_page.dart';
import 'package:go_router_example/main_page/main_cubit.dart';
import 'package:go_router_example/one/one.dart';
import 'package:go_router_example/three/three.dart';
import 'package:go_router_example/two/two.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (val) => change(val, context),
        children: const [
          CounterPage(),
          OneScreen(),
          TwoScreen(),
          ThreeScreen(),
        ],
      ),
      bottomNavigationBar: BlocBuilder<MainCubit, int>(
        builder: (context, state) {
          return NavigationBar(
            selectedIndex: state,
            onDestinationSelected: (val) => change(val, context),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.code),
                label: 'One',
              ),
              NavigationDestination(
                icon: Icon(Icons.color_lens),
                label: 'Two',
              ),
              NavigationDestination(
                icon: Icon(Icons.dialpad),
                label: 'Three',
              ),
              NavigationDestination(
                icon: Icon(Icons.coronavirus),
                label: 'Four',
              ),
            ],
          );
        },
      ),
    );
  }

  void change(int val, BuildContext context) {
    controller.animateToPage(
      val,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    context.read<MainCubit>().change(val);
  }
}
