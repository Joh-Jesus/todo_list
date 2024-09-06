import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/core/core.dart';

class HomeRepository implements IHomeRepository {
  final ILocalStorage _localStorage = Modular.get();
  @override
  List<TodoModel> getTodos() {
    _localStorage.getByKey("todos");
    return <TodoModel>[];
  }
}
