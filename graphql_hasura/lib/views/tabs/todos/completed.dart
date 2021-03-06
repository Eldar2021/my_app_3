import 'package:flutter/material.dart';

import '../../../components/add_task.dart';
import '../../../components/to_do_item_tile.dart';
import '../../../data/todo_fetch.dart';
import '../../../data/todo_list.dart';

class Completed extends StatefulWidget {
  const Completed({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CompletedState createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AddTask(
          onAdd: (value) {
            todoList.addTodo(value);
          },
        ),
        Expanded(
          child: ListView.builder(
            itemCount: todoList.completeList.length,
            itemBuilder: (context, index) {
              return TodoItemTile(
                toggleDocument: TodoFetch.toggleTodo,
                item: todoList.completeList[index],
                toggleRunMutaion: const {
                  'id': 1,
                  'isCompleted': true,
                },
                deleteDocument: TodoFetch.deleteTodo,
                deleteRunMutaion: const {
                  'id': 1,
                },
                toggleIsCompleted: () {
                  setState(() {
                    todoList.toggleList(todoList.completeList[index].id);
                  });
                },
                refetchQuery: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
