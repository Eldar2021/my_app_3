import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../module/module.dart';
import 'home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (val) => transion(val, context),
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          UsersPage(),
          CounterView(title: 'title'),
          UsersPage(),
          CounterView(title: 'title'),
        ],
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, int>(
        builder: (context, state) {
          return NavigationBar(
            onDestinationSelected: (val) => transion(val, context),
            selectedIndex: state,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_sharp),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.supervised_user_circle_outlined),
                label: 'Users',
              ),
              NavigationDestination(
                icon: Icon(Icons.plus_one_rounded),
                label: 'Counter',
              ),
              NavigationDestination(
                icon: Icon(Icons.attribution_sharp),
                label: 'Counter',
              ),
            ],
          );
        },
      ),
    );
  }

  void transion(int val, BuildContext context) async {
    controller.animateToPage(
      val,
      duration: const Duration(microseconds: 400),
      curve: Curves.ease,
    );
    context.read<HomeCubit>().change(val);
  }
}
