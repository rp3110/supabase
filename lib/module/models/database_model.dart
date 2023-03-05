import 'dart:convert';

List<Todo> todoFromJson(String str) =>
    List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String todoToJson(List<Todo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todo {
  Todo(
    this.id,
    this.createdAt,
    this.title,
    this.description,
  );

  int id;
  DateTime createdAt;
  String title;
  String description;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        json["id"],
        DateTime.parse(json["created_at"]),
        json["title"],
        json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "title": title,
        "description": description,
      };
}
