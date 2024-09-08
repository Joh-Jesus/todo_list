class TodoModel {
  /// Identificador da tarefa
  String id;

  /// Titulo da tarefa
  final String title;

  /// Descrição da tarefa
  final String description;

  /// Verifica se a tarefa foi concluída
  /// Obs: Preferi usar a variavel ao inves de duas listas extras.
  bool done;

  TodoModel({required this.title, required this.description, required this.done, required this.id});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        title: json['title'],
        description: json['description'],
        done: json['isDone'],
        id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'description': description, 'isDone': done, 'id': id};
  }
}
