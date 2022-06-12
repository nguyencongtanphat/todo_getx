import 'dart:convert';

class Todo {
  bool isCompleted;
  String text;
  Todo({this.isCompleted = false, required this.text});

  // factory Todo.fromJson(Map<String, dynamic> json) =>
  //     Todo(text: json['text'], isCompleted: json['isCompleted']);
  Todo.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        isCompleted = json['isCompleted'];
  // text: json['text'], isCompleted: json['isCompleted'];

  Map<String, dynamic> toJson() => {
        'isCompleted': isCompleted,
        'text': text,
      };
}
