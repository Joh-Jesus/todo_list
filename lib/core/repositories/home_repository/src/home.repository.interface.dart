import 'package:todo_list/core/core.dart';

abstract interface class IHomeRepository {
  List<TodoModel> getTodos();
}
