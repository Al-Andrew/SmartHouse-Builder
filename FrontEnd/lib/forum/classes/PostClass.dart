import './CommentClass.dart';
import './ReportClass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Post {
  int id;
  String topic;
  String content;
  String author;
  String date;
  late int nrLikes;
  late int nrComments;
  List<Comment> comments = Comment.getComments();
  List<Report> reports = Report.getReports();

  Post({
    required this.id,
    required this.topic,
    required this.content,
    required this.author,
    required this.date,
    required this.comments,
    required this.reports,
  });

  factory Post.fromJson(dynamic json) {
    return Post(
        id: json["id"],
        date: json["date"],
        topic: json["title"],
        content: json["content"],
        author: "Marcel",
        comments: [],
        reports: []);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': topic,
        'content': content,
        'author': author,
        'date': date,
      };

  void addComment(int id, int id_user, int id_post, String content,
      String author, String date, int nrLikes) {
    Comment comment = new Comment(
        id: 200,
        id_user: id_user,
        id_post: id_post,
        content: content,
        author: author,
        date: "05/19/2022");
    comments.add(comment);
    nrComments = comments.length;
    print(jsonEncode(comment));
    http.post(Uri.parse('http://localhost:8070/api/forum/comment'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(comment));
  }

  void addReport(int id, int id_author, int id_post, String title,
      String motivation, String date) {
    reports.add(new Report(
      id: id,
      id_author: id_author,
      id_post: id_post,
      title: title,
      motivation: motivation,
      date: date,
    ));
    print(id);
    print(motivation);
    print(title);
  }

  static void removePosts(List<Post> selectedPosts, List<Post> myPosts) {
    if (selectedPosts.isNotEmpty) {
      List<Post> tmp = [];
      tmp.addAll(selectedPosts);
      for (Post post in tmp) {
        int idCopy = post.id;
        http.delete(Uri.parse('http://localhost:8070/api/forum/$idCopy'));
        myPosts.remove(post);
        selectedPosts.remove(post);
      }
    }
  }

  void setNrLikes(int newNrLikes) {
    this.nrLikes = newNrLikes;
  }

  static Future<List<Post>> getPosts() async {
    print("1");
    print(Uri.parse('http://localhost:8070/api/forum'));

    http.get(Uri.parse('http://localhost:8070/api/forum'));
    final response = await http.get(
        Uri.parse(
          'http://localhost:8070/api/forum',
        ),
        headers: {"Access-Control-Allow-Origin": "*"});
    print("2");
    List<Post> posts = [];

    var jsonData = json.decode(response.body);
    for (var v in jsonData) {
      print(v);
      print('Spatiu');
      Post postare = Post.fromJson(v);

      int postId = Post.fromJson(v).id;
      print("Id post");
      print(postId);
      final response2 = await http.get(
          Uri.parse(
            'http://localhost:8070/api/forum/comment/$postId',
          ),
          headers: {"Access-Control-Allow-Origin": "*"});
      for (var comment in jsonDecode(response2.body)) {
        Comment com = Comment.fromJson(comment);
        //postare.nrComments++;
        //print(postare.nrComments);
        postare.comments.add(com);
      }
      postare.nrComments = postare.comments.length;
      postare.nrLikes = 0;
      posts.add(postare);
    }

    return posts;
  }

  static Future<List<Post>> getMyPosts(int userId) async {
    final response = await http.get(
        Uri.parse(
          'http://localhost:8070/api/forum/$userId',
        ),
        headers: {"Access-Control-Allow-Origin": "*"});
    List<Post> posts = [];

    var jsonData = json.decode(response.body);
    for (var v in jsonData) {
      print(v);
      print('Spatiu');
      Post postHere = Post.fromJson(v);
      postHere.nrLikes = 0;
      postHere.nrComments = 0;
      posts.add(postHere);
    }

    return posts;
  }
}
