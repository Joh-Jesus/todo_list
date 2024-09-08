import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list/core/core.dart';
import 'package:uuid/uuid.dart';

part 'home.store.g.dart';

// ignore: library_private_types_in_public_api
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final IHomeRepository _repository = Modular.get();

  @observable
  bool loading = true;

  @observable
  bool checkingLoading = false;

  @observable
  List<TodoModel> todos = <TodoModel>[];

  @observable
  List<TodoModel> filteredTodos = [];

  @observable
  HomeFilterStatus filterStatus = HomeFilterStatus.all;

  /// This method is responsible for fetching all Todos.
  @action
  getTodos() async {
    loading = true;
    todos = await _repository.getTodos();
    filterTodos();
    loading = false;
  }

  /// This method is responsible for creating a new Todo.
  @action
  Future createTodo({required String title, required String description}) async {
    loading = true;
    try {
      todos.add(
          TodoModel(id: const Uuid().v4(), title: title, description: description, done: false));
      await _repository.updateTodo(todos);
      filterTodos();
      Modular.to.pop();
      loading = false;
    } catch (e) {
      loading = false;
      debugPrint(e.toString());
    }
  }

  /// This method is responsible for validating the input fields.
  String? validatorInput(String? value) {
    if (value == null || value.isEmpty) {
      return "Campo obrigatório";
    }
    return null;
  }

  /// This method is responsible for updating the Todo status.
  @action
  Future checkTodo(String id, bool check) async {
    checkingLoading = true;
    await Future.delayed(const Duration(milliseconds: 200), () {});
    try {
      final index = todos.indexWhere((element) => element.id == id);
      todos[index].done = check;
      await _repository.updateTodo(todos);
      filterTodos();
      checkingLoading = false;
    } catch (e) {
      checkingLoading = false;
      debugPrint(e.toString());
    }
  }

  /// This method is responsible for update the filter status.
  @action
  void updateStatus(HomeFilterStatus status) {
    filterStatus = status;
    filterTodos();
  }

  /// This method is responsible for removing a Todo.
  @action
  Future removeTodo(String id) async {
    if (loading) {
      return;
    }
    loading = true;
    try {
      final index = todos.indexWhere((element) => element.id == id);
      todos.removeAt(index);
      await _repository.updateTodo(todos);
      filterTodos();
      loading = false;
    } catch (e) {
      loading = false;
      debugPrint(e.toString());
    }
  }

  /// This method is responsible for filtering the Todos.
  @action
  List<TodoModel> filterTodos() {
    switch (filterStatus) {
      case HomeFilterStatus.all:
        return filteredTodos = todos;
      case HomeFilterStatus.done:
        return filteredTodos = todos.where((element) => element.done).toList();
      case HomeFilterStatus.undone:
        return filteredTodos = todos.where((element) => !element.done).toList();
    }
  }
}
