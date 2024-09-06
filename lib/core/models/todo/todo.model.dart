class TodoModel {
  /// Titulo da tarefa
  final String title;

  /// Descrição da tarefa
  final String description;

  /// Se a tarefa foi concluída
  final bool isDone;

  TodoModel({required this.title, required this.description, required this.isDone});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        title: json['title'], description: json['description'], isDone: json['isDone']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'description': description, 'isDone': isDone};
  }
}
