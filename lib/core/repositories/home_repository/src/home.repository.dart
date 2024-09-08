import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/core/core.dart';

class HomeRepository implements IHomeRepository {
  final ILocalStorage _localStorage = Modular.get();
  @override
  Future<List<TodoModel>> getTodos() async {
    final result = await _localStorage.getByKey("todos");

    final todos = jsonDecode(result ?? "[]") as List;
    return todos.map((e) => TodoModel.fromJson(e)).toList();
  }

  @override
  Future updateTodo(List<TodoModel> todos) async {
    await _localStorage.save("todos", jsonEncode(todos));
  }
}
