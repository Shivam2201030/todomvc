import 'dart:convert';

class Todo {
  String name;
  String date;
  String id;

  Todo({
    required this.name,
    required this.date,
    required this.id,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    name: json['name'],
    date: json['date'],
    id: json['ID'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'date': date,
    'ID': id,
  };

  static List<String> encodeTodos(List<Todo> todos) =>
      todos.map((todo) => json.encode(todo.toJson())).toList();

  static List<Todo> decodeTodos(List<String> todos) =>
      todos.map((todo) => Todo.fromJson(json.decode(todo))).toList();
}
