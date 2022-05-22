import 'dart:html';

import './CommentClass.dart';
import './ReportClass.dart';
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

  Post({
    required this.id,
    required this.topic,
    required this.content,
    required this.author,
    required this.date,
    required this.tags,
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
        tags: [],
        comments: [],
        reports: []);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': topic,
        'content': content,
        'author': author,
        'date': date,
        'comments': comments
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

  void removeComment(Comment comment) {
    comments.remove(comment);
  }

  static void sortPosts(bool checkedRecent, bool checkedCommented,
      bool checkedPopular, String route) async {
    //print('ok');
    print(checkedCommented);
    print(checkedPopular);
    print(checkedRecent);
    print(route);
    if (route == '/myposts') {
      if (checkedRecent == true) {
        globals.isSorted = true;
        final response =
            await http.post(Uri.parse('http://localhost:8070/api/forum/sort/1'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: json.encode(globals.myPosts));
        var jsonData = json.decode(response.body);
        List<Post> posts = [];
        for (var v in jsonData) {
          Post postare = Post.fromJson(v);

          int postId = Post.fromJson(v).id;
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
          posts.add(postare);
        }
        globals.myPosts = posts;
      }
      if (checkedCommented == true) {
        globals.isSorted = true;
        final response =
            await http.post(Uri.parse('http://localhost:8070/api/forum/sort/3'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: json.encode(globals.myPosts));

        var jsonData = json.decode(response.body);
        List<Post> posts = [];
        for (var v in jsonData) {
          Post postare = Post.fromJson(v);

          int postId = Post.fromJson(v).id;
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
          posts.add(postare);
        }
        globals.myPosts = posts;
      }
      if (checkedPopular == true) {
        globals.isSorted = true;
        final response =
            await http.post(Uri.parse('http://localhost:8070/api/forum/sort/2'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: json.encode(globals.myPosts));

        var jsonData = json.decode(response.body);
        List<Post> posts = [];
        for (var v in jsonData) {
          Post postare = Post.fromJson(v);

          int postId = Post.fromJson(v).id;
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
          posts.add(postare);
        }
        globals.myPosts = posts;
      }
    } else {
      if (checkedRecent == true) {
        globals.isSorted = true;
        final response =
            await http.post(Uri.parse('http://localhost:8070/api/forum/sort/1'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: json.encode(globals.posts));
        var jsonData = json.decode(response.body);
        List<Post> posts = [];
        for (var v in jsonData) {
          Post postare = Post.fromJson(v);

          int postId = Post.fromJson(v).id;
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
          posts.add(postare);
        }
        globals.posts = posts;
      }
      if (checkedCommented == true) {
        globals.isSorted = true;
        final response =
            await http.post(Uri.parse('http://localhost:8070/api/forum/sort/3'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: json.encode(globals.posts));

        var jsonData = json.decode(response.body);
        List<Post> posts = [];
        for (var v in jsonData) {
          Post postare = Post.fromJson(v);

          int postId = Post.fromJson(v).id;
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
          posts.add(postare);
        }
        globals.posts = posts;
      }
      if (checkedPopular == true) {
        globals.isSorted = true;
        final response =
            await http.post(Uri.parse('http://localhost:8070/api/forum/sort/2'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: json.encode(globals.posts));

        var jsonData = json.decode(response.body);
        List<Post> posts = [];
        for (var v in jsonData) {
          Post postare = Post.fromJson(v);

          int postId = Post.fromJson(v).id;
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
          posts.add(postare);
        }
        globals.posts = posts;
      }
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
        http.delete(Uri.parse('http://localhost:8070/api/forum/$idCopy'));
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
      //print(v);
      //print('Spatiu');
      Post postHere = Post.fromJson(v);
      int postId = Post.fromJson(v).id;
      final response2 = await http.get(
          Uri.parse(
            'http://localhost:8070/api/forum/comment/$postId',
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
        comments: Comment.getLocalComments(),
        reports: Report.getLocalReports(),
      ),
    );
    posts.add(
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content:
            "Hello everyone! I just got started with tehnology and as every beginner..Its kinda hard to get used to the nowadays techonology. I just found out about Alexa and I need some opinions about her. Is she worth it? I mean I saw a lot of very good feedback about her but still I have my doubts. Moreover could I (less than an average man in techonology) get along with her? She could the perfect tool for me but still if I cant use her its still uselessfor your suggestions and answers! Thank you!",
        author: 'John H.',
        date: '06/04/2022',
        tags: ["Review", "Comment"],
        comments: Comment.getLocalComments(),
        reports: Report.getLocalReports(),
      ),
    );
    posts.add(
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content:
            "Hello everyone! I just got started with tehnology and as every beginner..Its kinda hard to get used to the nowadays techonology. I just found out about Alexa and I need some opinions about her. Is she worth it? I mean I saw a lot of very good feedback about her but still I have my doubts. Moreover could I (less than an average man in techonology) get along with her? She could the perfect tool for me but still if I cant use her its still uselessfor your suggestions and answers! Thank you!",
        author: 'John H.',
        date: '06/04/2022',
        tags: ["Review", "Comment"],
        comments: Comment.getLocalComments(),
        reports: Report.getLocalReports(),
      ),
    );
    posts.add(
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content:
            "Hello everyone! I just got started with tehnology and as every beginner..Its kinda hard to get used to the nowadays techonology. I just found out about Alexa and I need some opinions about her. Is she worth it? I mean I saw a lot of very good feedback about her but still I have my doubts. Moreover could I (less than an average man in techonology) get along with her? She could the perfect tool for me but still if I cant use her its still uselessfor your suggestions and answers! Thank you!",
        author: 'John H.',
        date: '06/04/2022',
        tags: ["Review", "Comment"],
        comments: Comment.getLocalComments(),
        reports: Report.getLocalReports(),
      ),
    );
    posts.add(
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content:
            "Hello everyone! I just got started with tehnology and as every beginner..Its kinda hard to get used to the nowadays techonology. I just found out about Alexa and I need some opinions about her. Is she worth it? I mean I saw a lot of very good feedback about her but still I have my doubts. Moreover could I (less than an average man in techonology) get along with her? She could the perfect tool for me but still if I cant use her its still uselessfor your suggestions and answers! Thank you!",
        author: 'John H.',
        date: '06/04/2022',
        tags: ["Review", "Comment"],
        comments: Comment.getLocalComments(),
        reports: Report.getLocalReports(),
      ),
    );
    posts.add(
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content:
            "Hello everyone! I just got started with tehnology and as every beginner..Its kinda hard to get used to the nowadays techonology. I just found out about Alexa and I need some opinions about her. Is she worth it? I mean I saw a lot of very good feedback about her but still I have my doubts. Moreover could I (less than an average man in techonology) get along with her? She could the perfect tool for me but still if I cant use her its still uselessfor your suggestions and answers! Thank you!",
        author: 'John H.',
        date: '06/04/2022',
        tags: ["Review", "Comment"],
        comments: Comment.getLocalComments(),
        reports: Report.getLocalReports(),
      ),
    );
    posts.add(
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content:
            "Hello everyone! I just got started with tehnology and as every beginner..Its kinda hard to get used to the nowadays techonology. I just found out about Alexa and I need some opinions about her. Is she worth it? I mean I saw a lot of very good feedback about her but still I have my doubts. Moreover could I (less than an average man in techonology) get along with her? She could the perfect tool for me but still if I cant use her its still uselessfor your suggestions and answers! Thank you!",
        author: 'John H.',
        date: '06/04/2022',
        tags: ["Review", "Comment"],
        comments: Comment.getLocalComments(),
        reports: Report.getLocalReports(),
      ),
    );
    posts.add(
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content:
            "Hello everyone! I just got started with tehnology and as every beginner..Its kinda hard to get used to the nowadays techonology. I just found out about Alexa and I need some opinions about her. Is she worth it? I mean I saw a lot of very good feedback about her but still I have my doubts. Moreover could I (less than an average man in techonology) get along with her? She could the perfect tool for me but still if I cant use her its still uselessfor your suggestions and answers! Thank you!",
        author: 'John H.',
        date: '06/04/2022',
        tags: ["Review", "Comment"],
        comments: Comment.getLocalComments(),
        reports: Report.getLocalReports(),
      ),
    );
    posts.add(
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content:
            "Hello everyone! I just got started with tehnology and as every beginner..Its kinda hard to get used to the nowadays techonology. I just found out about Alexa and I need some opinions about her. Is she worth it? I mean I saw a lot of very good feedback about her but still I have my doubts. Moreover could I (less than an average man in techonology) get along with her? She could the perfect tool for me but still if I cant use her its still uselessfor your suggestions and answers! Thank you!",
        author: 'John H.',
        date: '06/04/2022',
        tags: ["Review", "Comment"],
        comments: Comment.getLocalComments(),
        reports: Report.getLocalReports(),
      ),
    );
    posts.add(
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content:
            "Hello everyone! I just got started with tehnology and as every beginner..Its kinda hard to get used to the nowadays techonology. I just found out about Alexa and I need some opinions about her. Is she worth it? I mean I saw a lot of very good feedback about her but still I have my doubts. Moreover could I (less than an average man in techonology) get along with her? She could the perfect tool for me but still if I cant use her its still uselessfor your suggestions and answers! Thank you!",
        author: 'John H.',
        date: '06/04/2022',
        tags: ["Review", "Comment"],
        comments: Comment.getLocalComments(),
        reports: Report.getLocalReports(),
      ),
    );
    posts.add(
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content:
            "Hello everyone! I just got started with tehnology and as every beginner..Its kinda hard to get used to the nowadays techonology. I just found out about Alexa and I need some opinions about her. Is she worth it? I mean I saw a lot of very good feedback about her but still I have my doubts. Moreover could I (less than an average man in techonology) get along with her? She could the perfect tool for me but still if I cant use her its still uselessfor your suggestions and answers! Thank you!",
        author: 'John H.',
        date: '06/04/2022',
        tags: ["Review", "Comment"],
        comments: Comment.getLocalComments(),
        reports: Report.getLocalReports(),
      ),
    );
    posts.add(
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content:
            "Hello everyone! I just got started with tehnology and as every beginner..Its kinda hard to get used to the nowadays techonology. I just found out about Alexa and I need some opinions about her. Is she worth it? I mean I saw a lot of very good feedback about her but still I have my doubts. Moreover could I (less than an average man in techonology) get along with her? She could the perfect tool for me but still if I cant use her its still uselessfor your suggestions and answers! Thank you!",
        author: 'John H.',
        date: '06/04/2022',
        tags: ["Review", "Comment"],
        comments: Comment.getLocalComments(),
        reports: Report.getLocalReports(),
      ),
    );
    posts.add(
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content:
            "Hello everyone! I just got started with tehnology and as every beginner..Its kinda hard to get used to the nowadays techonology. I just found out about Alexa and I need some opinions about her. Is she worth it? I mean I saw a lot of very good feedback about her but still I have my doubts. Moreover could I (less than an average man in techonology) get along with her? She could the perfect tool for me but still if I cant use her its still uselessfor your suggestions and answers! Thank you!",
        author: 'John H.',
        date: '06/04/2022',
        tags: ["Review", "Comment"],
        comments: Comment.getLocalComments(),
        reports: Report.getLocalReports(),
      ),
    );
    posts.add(
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content:
            "Hello everyone! I just got started with tehnology and as every beginner..Its kinda hard to get used to the nowadays techonology. I just found out about Alexa and I need some opinions about her. Is she worth it? I mean I saw a lot of very good feedback about her but still I have my doubts. Moreover could I (less than an average man in techonology) get along with her? She could the perfect tool for me but still if I cant use her its still uselessfor your suggestions and answers! Thank you!",
        author: 'John H.',
        date: '06/04/2022',
        tags: ["Review", "Comment"],
        comments: Comment.getLocalComments(),
        reports: Report.getLocalReports(),
      ),
    );

    return posts;
  }
}
