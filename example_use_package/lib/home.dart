import 'package:decrement/decrement.dart';
import 'package:example_use_package/const.dart';
import 'package:flutter/material.dart';
import 'package:increment/increment.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController controller;
  int index = 0;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final str = AppString.instance;
    return Scaffold(
      body: PageView(
        onPageChanged: changePage,
        controller: controller,
        children: [
          IncrementPage(title: str.iTitle),
          DecrementPage(title: str.iTitle),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: changePage,
        selectedIndex: index,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.add_circle_outline),
            label: 'increment',
          ),
          NavigationDestination(
            icon: Icon(Icons.remove_circle_outline),
            label: 'increment',
          ),
        ],
      ),
    );
  }

  void changePage(int val) {
    controller.animateToPage(
      val,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    setState(() {
      index = val;
    });
  }
}
