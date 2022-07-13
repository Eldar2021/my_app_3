import 'dart:developer';

import 'package:http/http.dart' as http;

import 'todo_model.dart';

class TodoRepo {
  final http.Client _cleint;

  TodoRepo(this._cleint);

  Future<List<Todo>?> fetchData() async {
    try {
      final res = await _cleint.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      return todoFromJson(res.body);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
