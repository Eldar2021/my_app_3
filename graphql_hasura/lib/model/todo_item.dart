import 'dart:convert';

class TodoItem {
  final int id;
  final String task;
  bool isCompleted;

  TodoItem(
    this.id,
    this.task,
    this.isCompleted,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task': task,
      'isCompleted': isCompleted,
    };
  }

  factory TodoItem.fromMap(Map<String, dynamic> map) {
    return TodoItem(
      map['id']?.toInt() ?? 0,
      map['task'] ?? '',
      map['isCompleted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoItem.fromJson(String source) => TodoItem.fromMap(
        json.decode(source),
      );
}
