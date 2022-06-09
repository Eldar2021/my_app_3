import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../components/add_task.dart';
import '../../../components/to_do_item_tile.dart';
import '../../../data/online_fetch_data.dart';
import '../../../data/todo_fetch.dart';
import '../../../data/todo_list.dart';
import '../../../model/todo_item.dart';

class All extends StatefulWidget {
  const All({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  late final GraphQLClient _client;

  runOnlineMutation(context) {
    _client = GraphQLProvider.of(context).value;
    Future.doWhile(
      () async {
        _client.mutate(
          MutationOptions(
            document: gql(OnlineFetch.updateStatus),
            variables: {
              'now': DateTime.now().toUtc().toIso8601String(),
            },
          ),
        );
        await Future.delayed(const Duration(seconds: 30));
        return true;
      },
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => runOnlineMutation(context));
    super.initState();
  }

  VoidCallback? refetchQuery;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Mutation(
          options: MutationOptions(
            document: gql(TodoFetch.addTodo),
            update: (cache, result) {
              cache;
            },
            onCompleted: (dynamic resultData) {
              refetchQuery!();
            },
          ),

          /// builder
          builder: (RunMutation runMutation, QueryResult? result) {
            return AddTask(
              onAdd: (value) {
                todoList.addTodo(value);
                runMutation({'title': value, 'isPublic': false});
              },
            );
          },
        ),
        Expanded(
          child: Query(
            options: QueryOptions(
              document: gql(TodoFetch.fetchAll),
              // variables: const {"is_public": false},
            ),
            builder: (QueryResult res, {VoidCallback? refetch, FetchMore? fetchMore}) {
              refetchQuery = refetch;
              if (res.hasException) {
                return Text(res.exception.toString());
              } else if (res.isLoading) {
                return const Text('Loading');
              } else {
                final List<dynamic> todos = (res.data!['todos'] as List<dynamic>).cast<dynamic>();
                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    dynamic data = todos[index];
                    return TodoItemTile(
                      toggleDocument: TodoFetch.toggleTodo,
                      toggleRunMutaion: {
                        'id': data["id"],
                        'isCompleted': !data['is_completed'],
                      },
                      refetchQuery: refetchQuery ?? () {},
                      item: TodoItem(
                        data['id'],
                        data['title'],
                        data['is_completed'],
                      ),
                      deleteDocument: TodoFetch.deleteTodo,
                      deleteRunMutaion: {
                        'id': data["id"],
                      },
                      toggleIsCompleted: () {},
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
