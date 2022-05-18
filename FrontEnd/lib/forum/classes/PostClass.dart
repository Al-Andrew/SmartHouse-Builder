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
  int nrLikes;
  int nrComments;
  List<Comment> comments = Comment.getComments();
  List<Report> reports = Report.getReports();

  Post({
    required this.id,
    required this.topic,
    required this.content,
    required this.author,
    required this.date,
    required this.nrLikes,
    required this.nrComments,
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
        nrLikes: 0,
        nrComments: 0,
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
    comments.add(new Comment(
        id: id,
        id_user: id_user,
        id_post: id_post,
        content: content,
        author: author,
        date: date,
        nrLikes: nrLikes));
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
        myPosts.remove(post);
        selectedPosts.remove(post);
      }
    }
  }

  void setNrLikes(int newNrLikes) {
    this.nrLikes = newNrLikes;
  }

  static Future<List<Post>> getPosts() async {
    final response = await http.get(
        Uri.parse(
          'http://localhost:8070/api/forum',
        ),
        headers: {"Access-Control-Allow-Origin": "*"});
    List<Post> posts = [];

    var jsonData = json.decode(response.body);
    for (var v in jsonData) {
      print(v);
      print('Spatiu');
      posts.add(Post.fromJson(v));
    }

    return posts;
  }

  static Future<List<Post>> getMyPosts() async {
    final response = await http.get(
        Uri.parse(
          'http://localhost:8070/api/forum',
        ),
        headers: {"Access-Control-Allow-Origin": "*"});
    List<Post> posts = [];

    var jsonData = json.decode(response.body);
    for (var v in jsonData) {
      print(v);
      print('Spatiu');
      posts.add(Post.fromJson(v));
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
        nrLikes: 5,
        nrComments: 2,
        comments: Comment.getComments(),
        reports: Report.getReports(),
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
        nrLikes: 5,
        nrComments: 2,
        comments: Comment.getComments(),
        reports: Report.getReports(),
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
        nrLikes: 5,
        nrComments: 2,
        comments: Comment.getComments(),
        reports: Report.getReports(),
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
        nrLikes: 5,
        nrComments: 2,
        comments: Comment.getComments(),
        reports: Report.getReports(),
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
        nrLikes: 5,
        nrComments: 2,
        comments: Comment.getComments(),
        reports: Report.getReports(),
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
        nrLikes: 5,
        nrComments: 2,
        comments: Comment.getComments(),
        reports: Report.getReports(),
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
        nrLikes: 5,
        nrComments: 2,
        comments: Comment.getComments(),
        reports: Report.getReports(),
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
        nrLikes: 5,
        nrComments: 2,
        comments: Comment.getComments(),
        reports: Report.getReports(),
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
        nrLikes: 5,
        nrComments: 2,
        comments: Comment.getComments(),
        reports: Report.getReports(),
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
        nrLikes: 5,
        nrComments: 2,
        comments: Comment.getComments(),
        reports: Report.getReports(),
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
        nrLikes: 5,
        nrComments: 2,
        comments: Comment.getComments(),
        reports: Report.getReports(),
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
        nrLikes: 5,
        nrComments: 2,
        comments: Comment.getComments(),
        reports: Report.getReports(),
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
        nrLikes: 5,
        nrComments: 2,
        comments: Comment.getComments(),
        reports: Report.getReports(),
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
        nrLikes: 5,
        nrComments: 2,
        comments: Comment.getComments(),
        reports: Report.getReports(),
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
        nrLikes: 5,
        nrComments: 2,
        comments: Comment.getComments(),
        reports: Report.getReports(),
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
        nrLikes: 5,
        nrComments: 2,
        comments: Comment.getComments(),
        reports: Report.getReports(),
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
        nrLikes: 5,
        nrComments: 2,
        comments: Comment.getComments(),
        reports: Report.getReports(),
      ),
    );

    return posts;
  }
}
