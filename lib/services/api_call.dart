import 'dart:convert';

import '../models/todo_model.dart';
import 'package:http/http.dart' as http;

class APICall {
  static fetchTodos() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET', Uri.parse('https://node-todo-api-yjo3.onrender.com/todos/'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();
      print(resp);
      final todo = todoFromJson(resp);
      print(todo.length);
      return todo;
    } else {
      print(response.reasonPhrase);
    }
  }

  static addTodo(String title) async {
    Map map = {"task": title, "id": DateTime.now().toIso8601String()};
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://node-todo-api-yjo3.onrender.com/todos/'));
    request.body = json.encode(map);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static deleteTodo(String id) async {
    var request = http.Request('DELETE',
        Uri.parse('https://node-todo-api-yjo3.onrender.com/todos/$id'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static updateTodo(String id, bool completed) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'PUT', Uri.parse('https://node-todo-api-yjo3.onrender.com/todos/$id'));
    request.body = json.encode({"completed": completed});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
