import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobx_example/fetch_api/data/todo_repo.dart';
import 'package:mobx_example/fetch_api/logic/fetch_data_mobx.dart';
import 'package:provider/provider.dart';

import '../fetch_api/view/fetch_api_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider(
        create: (context) => FetchDataMobx(TodoRepo(Client()))..fetchData(),
        child: const TodoView(),
      ),
    );
  }
}
