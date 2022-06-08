import 'package:flutter/material.dart';

import '../../../components/add_task.dart';
import '../../../components/to_do_item_tile.dart';
import '../../../data/todo_list.dart';

class All extends StatefulWidget {
  const All({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  void initState() {
    super.initState();
  }

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
            itemCount: todoList.list.length,
            itemBuilder: (context, index) {
              return TodoItemTile(
                item: todoList.list[index],
                delete: () {
                  setState(() {
                    todoList.removeTodo(todoList.list[index].id);
                  });
                },
                toggleIsCompleted: () {
                  setState(() {
                    todoList.toggleList(todoList.list[index].id);
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
