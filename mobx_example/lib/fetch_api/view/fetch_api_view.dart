import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/fetch_api/logic/fetch_data_mobx.dart';
import 'package:provider/provider.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  // final FetchDataMobx _mobx = FetchDataMobx(TodoRepo(Client()));

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsFlutterBinding.ensureInitialized();
  //   _mobx.fetchData();
  // }

  @override
  Widget build(BuildContext context) {
    final mobx = Provider.of<FetchDataMobx>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('TodoView'),
      ),
      body: Observer(
        builder: (_) {
          if (mobx.type == FetctType.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (mobx.type == FetctType.success && mobx.todos != null) {
            return ListView.builder(
              itemCount: mobx.todos!.value!.length,
              itemBuilder: (context, index) {
                final todo = mobx.todos!.value![index];
                return ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.body),
                );
              },
            );
          } else {
            return const Center(child: Text('error'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await mobx.fetchData();
      }),
    );
  }
}
