class TodoModel {
  int? id;
  String title;
  String description;
  bool isDone;

  TodoModel({
    this.id,
    required this.title,
    required this.description,
    this.isDone = false,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isDone: json['isDone'] == 1 ? true : false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone ? 1 : 0,
    };
  }

  @override
  String toString() {
    return 'TodoModel{id: $id, title: $title, description: $description, isDone: $isDone}';
  }
}
