import 'package:flutter/material.dart';

import '../services/shared_preferences_service.dart';
import 'tabs/dashboard/feeds.dart';
import 'tabs/dashboard/online.dart';
import 'tabs/dashboard/todos.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "ToDo App",
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () async {
                sharedPreferenceService.clearToken();
                Navigator.pushReplacementNamed(context, "/login");
              },
            ),
          ],
        ),
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(
              text: "Todos",
              icon: Icon(Icons.edit),
            ),
            Tab(
              text: "Feeds",
              icon: Icon(Icons.message),
            ),
            Tab(
              text: "Online",
              icon: Icon(Icons.people),
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            Todos(),
            Feeds(),
            Online(),
          ],
        ),
      ),
    );
  }
}
