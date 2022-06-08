import 'package:flutter/material.dart';

import '../model/todo_item.dart';

class TodoItemTile extends StatelessWidget {
  const TodoItemTile({
    Key? key,
    required this.item,
    required this.delete,
    required this.toggleIsCompleted,
  }) : super(key: key);

  final TodoItem item;
  final Function delete;
  final Function toggleIsCompleted;

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
        leading: InkWell(
          onTap: () {
            toggleIsCompleted();
          },
          child: Container(
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(
              !item.isCompleted ? Icons.radio_button_unchecked : Icons.radio_button_checked,
            ),
          ),
        ),
        trailing: InkWell(
          onTap: () {
            delete();
          },
          child: Container(
            decoration: const BoxDecoration(
              border: Border(left: BorderSide()),
            ),
            width: 60,
            height: double.infinity,
            child: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
