import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'home.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.httpLink});

  final Link httpLink;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ValueNotifier<GraphQLClient> client;

  @override
  void initState() {
    super.initState();
    client = ValueNotifier(
      GraphQLClient(
        link: widget.httpLink,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(store: HiveStore()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
