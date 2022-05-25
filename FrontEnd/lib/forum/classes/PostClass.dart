import 'dart:html';
import 'dart:io';

import './CommentClass.dart';
import './ReportClass.dart';
import './Tags.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../ForumGlobals.dart' as globals;

class Post {
  int id;
  String topic;
  String content;
  String author;
  String date;
  int nrLikes = 0;
  int nrComments = 0;
  List<String> tags;
  List<Comment> comments;
  List<Report> reports;
  Tags tags_integers;

  Post({
    required this.id,
    required this.topic,
    required this.content,
    required this.author,
    required this.date,
    required this.tags_integers,
    required this.comments,
    required this.reports,
    required this.tags,
  });

  factory Post.fromJson(dynamic json) {
    return Post(
        id: json["id_user"],
        date: json["date"],
        topic: json["title"],
        content: json["content"],
        author: "Marcel",
        tags: [],
        comments: [],
        reports: [],
        tags_integers: json["tags"]);
  }

  Map<String, dynamic> toJson() => {
        'id_user': id,
        'title': topic,
        'content': content,
        'author': author,
        'date': date,
        'tags': tags_integers,
        'comments': comments,
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
    http.post(
        Uri.parse(
            'https://smart-house-builder.azurewebsites.net/api/forum/comment'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(comment));
  }

////factory for posts
  static void addPost(
    int id,
    int id_author,
    String title,
    String date,
    String content,
    String author,
    Tags tags,
  ) {
    print('AM AJUNS AICI');
    /////Seeing that we get the info right

    ///---Let's create the object of type Post

    /*here we have a problem because the post from */
    Post newPost = new Post(
        id: id,
        topic: title,
        content: content,
        author: author,
        date: date,
        comments: <Comment>[],
        reports: <Report>[],
        tags_integers: tags,
        tags: <String>[]);
    print(newPost);
    print(jsonEncode(newPost));

    http.post(
        Uri.parse(
          'https://smart-house-builder.azurewebsites.net/api/forum',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(newPost));
  }

  void removeComment(Comment comment) {
    comments.remove(comment);
  }

  static void sortPosts(bool checkedRecent, bool checkedCommented,
      bool checkedPopular, String route) async {
    final queryParameters = {
      'Date': '$checkedRecent',
      'Comments': '$checkedCommented',
      'Popular': '$checkedPopular'
    };

    if (route == '/myposts') {
      globals.isSorted = true;
      final uri = Uri.http('smart-house-builder.azurewebsites.net',
          '/api/forum/sort/', queryParameters);

      var headers = {
        HttpHeaders.authorizationHeader: 'Token $String',
        HttpHeaders.contentTypeHeader: 'application/json',
      };
      final response = await http.post(uri,
          headers: headers, body: json.encode(globals.myPosts));
      var jsonData = json.decode(response.body);
      List<Post> posts = [];
      for (var v in jsonData) {
        Post postare = Post.fromJson(v);

        int postId = Post.fromJson(v).id;
        final response2 = await http.get(
            Uri.parse(
              'https://smart-house-builder.azurewebsites.net/api/forum/comment/$postId',
            ),
            headers: {"Access-Control-Allow-Origin": "*"});
        for (var comment in jsonDecode(response2.body)) {
          Comment com = Comment.fromJson(comment);
          postare.comments.add(com);
        }
        postare.nrComments = postare.comments.length;
        posts.add(postare);
      }
      globals.myPosts = posts;
    } else {
      globals.isSorted = true;
      final uri = Uri.http('smart-house-builder.azurewebsites.net',
          '/api/forum/sort/', queryParameters);
      var headers = {
        HttpHeaders.authorizationHeader: 'Token $String',
        HttpHeaders.contentTypeHeader: 'application/json',
      };
      final response = await http.post(uri,
          headers: headers, body: json.encode(globals.posts));
      var jsonData = json.decode(response.body);
      List<Post> posts = [];
      for (var v in jsonData) {
        Post postare = Post.fromJson(v);

        int postId = Post.fromJson(v).id;
        final response2 = await http.get(
            Uri.parse(
              'https://smart-house-builder.azurewebsites.net/api/forum/comment/$postId',
            ),
            headers: {"Access-Control-Allow-Origin": "*"});
        for (var comment in jsonDecode(response2.body)) {
          Comment com = Comment.fromJson(comment);
          postare.comments.add(com);
        }
        postare.nrComments = postare.comments.length;
        posts.add(postare);
      }
      globals.posts = posts;
    }
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

  static void removePosts(List<Post> selectedPosts) {
    if (selectedPosts.isNotEmpty) {
      List<Post> tmp = [];
      tmp.addAll(selectedPosts);
      for (Post post in tmp) {
        int idCopy = post.id;
        http.delete(Uri.parse(
            'https://smart-house-builder.azurewebsites.net/api/forum/$idCopy'));
        globals.myPosts.remove(post);
        selectedPosts.remove(post);
      }
    }
  }

  void setNrLikes(int newNrLikes) {
    this.nrLikes = newNrLikes;
  }

  static Future<List<Post>> getPosts() async {
    print("1");
    print(Uri.parse('https://smart-house-builder.azurewebsites.net/api/forum'));

    http.get(
        Uri.parse('https://smart-house-builder.azurewebsites.net/api/forum'));
    final response = await http.get(
        Uri.parse(
          'https://smart-house-builder.azurewebsites.net/api/forum',
        ),
        headers: {"Access-Control-Allow-Origin": "*"});
    print("2");
    List<Post> posts = [];

    var jsonData = json.decode(response.body);
    for (var v in jsonData) {
      Post postare = Post.fromJson(v);

      int postId = Post.fromJson(v).id;
      final response2 = await http.get(
          Uri.parse(
            'https://smart-house-builder.azurewebsites.net/api/forum/comment/$postId',
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
          'https://smart-house-builder.azurewebsites.net/api/forum/$userId',
        ),
        headers: {"Access-Control-Allow-Origin": "*"});
    List<Post> posts = [];

    var jsonData = json.decode(response.body);
    for (var v in jsonData) {
      Post postHere = Post.fromJson(v);
      int postId = Post.fromJson(v).id;
      final response2 = await http.get(
          Uri.parse(
            'https://smart-house-builder.azurewebsites.net/api/forum/comment/$postId',
          ),
          headers: {"Access-Control-Allow-Origin": "*"});
      for (var comment in jsonDecode(response2.body)) {
        Comment com = Comment.fromJson(comment);
        postHere.comments.add(com);
      }
      postHere.nrComments = postHere.comments.length;
      postHere.nrLikes = 0;
      posts.add(postHere);
    }

    return posts;
  }

  static Future<List<Post>> getLocalPosts() async {
    List<Post> posts = [];
    posts.add(
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content:
            "Hello everyone! I just got started with tehnology and as every beginner..Its kinda hard to get used to the nowadays techonology. I just found out about Alexa and I need some opinions about her. Is she worth it? I mean I saw a lot of very good feedback about her but still I have my doubts. Moreover could I (less than an average man in techonology) get along with her? She could the perfect tool for me but still if I cant use her its still uselessfor your suggestions and answers! Thank you!",
        author: 'John H.',
        date: '06/04/2022',
        tags: ["Review", "Question", "Setup", "Hardware", "Software"],
        tags_integers: new Tags(
            id: 1,
            flagReview: 1,
            flagQuestion: 1,
            flagSetup: 1,
            flagHard: 1,
            flagSoft: 1),
        comments: Comment.getLocalComments(),
        reports: Report.getLocalReports(),
      ),
    );
    return posts;
  }
}
