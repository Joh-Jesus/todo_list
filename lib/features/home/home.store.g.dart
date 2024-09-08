// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  Computed<List<TodoModel>>? _$filteredTodosComputed;

  @override
  List<TodoModel> get filteredTodos => (_$filteredTodosComputed ??=
          Computed<List<TodoModel>>(() => super.filteredTodos,
              name: '_HomeStore.filteredTodos'))
      .value;

  late final _$loadingAtom = Atom(name: '_HomeStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$checkingLoadingAtom =
      Atom(name: '_HomeStore.checkingLoading', context: context);

  @override
  bool get checkingLoading {
    _$checkingLoadingAtom.reportRead();
    return super.checkingLoading;
  }

  @override
  set checkingLoading(bool value) {
    _$checkingLoadingAtom.reportWrite(value, super.checkingLoading, () {
      super.checkingLoading = value;
    });
  }

  late final _$todosAtom = Atom(name: '_HomeStore.todos', context: context);

  @override
  List<TodoModel> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(List<TodoModel> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$filterStatusAtom =
      Atom(name: '_HomeStore.filterStatus', context: context);

  @override
  HomeFilterStatus get filterStatus {
    _$filterStatusAtom.reportRead();
    return super.filterStatus;
  }

  @override
  set filterStatus(HomeFilterStatus value) {
    _$filterStatusAtom.reportWrite(value, super.filterStatus, () {
      super.filterStatus = value;
    });
  }

  late final _$getTodosAsyncAction =
      AsyncAction('_HomeStore.getTodos', context: context);

  @override
  Future getTodos() {
    return _$getTodosAsyncAction.run(() => super.getTodos());
  }

  late final _$createTodoAsyncAction =
      AsyncAction('_HomeStore.createTodo', context: context);

  @override
  Future<dynamic> createTodo(
      {required String title, required String description}) {
    return _$createTodoAsyncAction
        .run(() => super.createTodo(title: title, description: description));
  }

  late final _$checkTodoAsyncAction =
      AsyncAction('_HomeStore.checkTodo', context: context);

  @override
  Future<dynamic> checkTodo(String id, bool check) {
    return _$checkTodoAsyncAction.run(() => super.checkTodo(id, check));
  }

  late final _$removeTodoAsyncAction =
      AsyncAction('_HomeStore.removeTodo', context: context);

  @override
  Future<dynamic> removeTodo(String id) {
    return _$removeTodoAsyncAction.run(() => super.removeTodo(id));
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void updateStatus(HomeFilterStatus status) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.updateStatus');
    try {
      return super.updateStatus(status);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
checkingLoading: ${checkingLoading},
todos: ${todos},
filterStatus: ${filterStatus},
filteredTodos: ${filteredTodos}
    ''';
  }
}
