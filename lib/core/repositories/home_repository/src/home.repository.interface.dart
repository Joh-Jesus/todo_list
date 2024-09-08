import 'package:todo_list/core/core.dart';

abstract interface class IHomeRepository {
  Future<List<TodoModel>> getTodos();
  Future updateTodo(List<TodoModel> todos);
}
