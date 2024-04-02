// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

List<Todo> todoFromJson(String str) =>
    List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String todoToJson(List<Todo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todo {
  String id;
  String task;
  bool completed;

  Todo({
    required this.id,
    required this.task,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"].toString(),
        task: json["task"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "task": task,
        "completed": completed,
      };
}
