import 'package:flutter/material.dart';

import '../../../data/online_list.dart';

class Online extends StatelessWidget {
  const Online({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            "Online Users",
            style: TextStyle(fontSize: 28),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: onlineList.list.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(onlineList.list[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
