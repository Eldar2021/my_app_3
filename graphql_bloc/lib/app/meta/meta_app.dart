import 'package:flutter/material.dart';
import 'package:graphql_bloc/api/api.dart';
import 'package:graphql_bloc/view/jobs/jobs_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: JobsPage(
        jobApiClient: JobApiClient.create(),
      ),
    );
  }
}
