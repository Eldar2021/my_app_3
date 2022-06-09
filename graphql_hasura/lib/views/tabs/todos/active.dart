import 'package:flutter/material.dart';

import '../../../components/add_task.dart';
import '../../../components/to_do_item_tile.dart';
import '../../../data/todo_fetch.dart';
import '../../../data/todo_list.dart';

class Active extends StatefulWidget {
  const Active({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ActiveState createState() => _ActiveState();
}

class _ActiveState extends State<Active> {
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
            itemCount: todoList.activeList.length,
            itemBuilder: (context, index) {
              return TodoItemTile(
                toggleRunMutaion: const {
                  'id': 1,
                  'isCompleted': true,
                },
                toggleDocument: TodoFetch.toggleTodo,
                item: todoList.activeList[index],
                deleteDocument: TodoFetch.deleteTodo,
                deleteRunMutaion: const {
                  'id': 1,
                },
                toggleIsCompleted: () {
                  setState(() {
                    todoList.toggleList(todoList.activeList[index].id);
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
