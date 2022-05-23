import 'package:dartz/dartz.dart' as dz;
import 'package:flutter/material.dart';
import 'package:mock_api/model.dart';
import 'package:mock_api/repo.dart';

import 'locator.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: MyHomePage(repo: sl<ModelRepository>()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.repo,
  }) : super(key: key);

  final ModelRepository repo;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('widget.title'),
      ),
      body: Center(
        child: FutureBuilder<dz.Either<Exception, Model>>(
          future: widget.repo.getModel(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return snapshot.data!.fold(
                (l) => Text(l.toString()),
                (r) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(r.image),
                  ),
                  title: Text('${r.id}'),
                  subtitle: Text(r.name),
                ),
              );
            } else if (snapshot.hasError) {
              return const Text('error');
            } else {
              return const Text('bilbeim');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
