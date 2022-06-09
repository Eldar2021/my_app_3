import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../model/todo_item.dart';

class TodoItemTile extends StatelessWidget {
  const TodoItemTile({
    Key? key,
    required this.item,
    required this.toggleIsCompleted,
    required this.toggleDocument,
    required this.toggleRunMutaion,
    required this.refetchQuery,
    required this.deleteDocument,
    required this.deleteRunMutaion,
  }) : super(key: key);

  final TodoItem item;
  final Function toggleIsCompleted;
  final String toggleDocument;
  final Map<String, dynamic> toggleRunMutaion;
  final Function refetchQuery;
  final String deleteDocument;
  final Map<String, dynamic> deleteRunMutaion;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        title: Text(
          item.task,
          style: TextStyle(
            decoration: item.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        leading: Mutation(
          options: MutationOptions(
            document: gql(toggleDocument),
            // ignore: void_checks
            update: (GraphQLDataProxy cache, QueryResult? result) {
              return cache;
            },
            onCompleted: (e) => refetchQuery(),
          ),
          builder: (
            RunMutation runMutation,
            QueryResult? result,
          ) {
            return InkWell(
              onTap: () {
                runMutation(
                  toggleRunMutaion,
                  optimisticResult: {
                    "action": {
                      "returning": [
                        {"is_completed": !item.isCompleted}
                      ]
                    }
                  },
                );
              },
              child: Container(
                height: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  !item.isCompleted ? Icons.radio_button_unchecked : Icons.radio_button_checked,
                ),
              ),
            );
          },
        ),
        trailing: Mutation(
          options: MutationOptions(
            document: gql(deleteDocument),
            onCompleted: (onValue) {
              refetchQuery();
            },
          ),
          builder: (
            RunMutation runMutation,
            QueryResult? result,
          ) {
            return InkWell(
              onTap: () {
                runMutation(deleteRunMutaion);
              },
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(left: BorderSide()),
                ),
                width: 60,
                height: double.infinity,
                child: const Icon(Icons.delete),
              ),
            );
          },
        ),
      ),
    );
  }
}
