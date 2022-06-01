import 'package:http/http.dart' as http;
import 'dart:convert';

class Comment {
  int id;
  int id_user;
  int id_post;
  String content;
  String author;
  String date;

  Comment({
    required this.id,
    required this.id_user,
    required this.id_post,
    required this.content,
    required this.author,
    required this.date,
  });
  dynamic toJson() => {
        'id': id,
        'id_user': id_user,
        'id_post': id_post,
        'content': content,
        'author': author,
        'date': date,
      };
  factory Comment.fromJson(dynamic json) {
    return Comment(
      id: json["id"],
      id_post: json["id_post"],
      id_user: json["id_user"],
      date: json["date"],
      content: json["content"],
      author: "Default Author",
    );
  }
}
