import 'package:flutter/material.dart';

import 'custom_button.dart';

class AddTask extends StatelessWidget {
  AddTask({Key? key, required this.onAdd}) : super(key: key);

  //final TodoList todoList;
  final Function onAdd;

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Add task",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              width: 90,
              height: 50,
              onTap: () {
                onAdd(_controller.text);
                _controller.clear();
                FocusScope.of(context).requestFocus(FocusNode());
              },
              text: "Add",
            ),
          )
        ],
      ),
    );
  }
}
