import 'package:flutter/material.dart';

import '../todos/active.dart';
import '../todos/all.dart';
import '../todos/completed.dart';

class Todos extends StatefulWidget {
  const Todos({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TodosState createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const TabBar(
            tabs: [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Active",
              ),
              Tab(
                text: "Completed",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            All(),
            Active(),
            Completed(),
          ],
        ),
      ),
    );
  }
}
