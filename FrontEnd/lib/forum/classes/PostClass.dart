import './CommentClass.dart';
import './ReportClass.dart';
//import 'package:http/http.dart' as http;
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
  });
  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        topic: json["title"],
        content: json["content"],
        author: json["author"],
        date: json["date"],
        nrLikes: 0,
        nrComments: 0,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': topic,
        'content': content,
        'author': author,
        'date': date,
      };

  void addComment(int id, int id_post, String content, String author,
      String date, int nrLikes) {
    comments.add(new Comment(
        id: id,
        id_post: id_post,
        content: content,
        author: author,
        date: date,
        nrLikes: nrLikes));
    print(id);
    print(id_post);
    print(content);
    print(author);
    print(date);
    print(nrLikes);
  }

  void setNrLikes(int newNrLikes) {
    nrLikes = newNrLikes;
  }

  // static Future<List<Post>> getPosts() async {
  //   var data = await http.get('http://localhost:8070/api/forum');
  //   List<Post> posts = [];
  //   if (data.statusCode == 200) {
  //     var jsonData = json.decode(data.body);
  //     for (var e in jsonData) {
  //       posts.add(Post.fromJson(e));
  //     }
  //   }
  //   return posts;
  // }

  static List<Post> getPosts() {
    return <Post>[
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content:
            "Hello everyone! I just got started with tehnology and as every beginner..Its kinda hard to get used to the nowadays techonology. I just found out about Alexa and I need some opinions about her. Is she worth it? I mean I saw a lot of very good feedback about her but still I have my doubts. Moreover could I (less than an average man in techonology) get along with her? She could the perfect tool for me but still if I cant use her its still uselessfor your suggestions and answers! Thank you!",
        author: 'John H.',
        date: '06/04/2022',
        nrLikes: 5,
        nrComments: 2,
      ),
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content: "CONTENT",
        author: 'John H.',
        date: '06/04/2022',
        nrLikes: 1,
        nrComments: 2,
      ),
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content: "CONTENT",
        author: 'John H.',
        date: '06/04/2022',
        nrLikes: 1,
        nrComments: 2,
      ),
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content: "CONTENT",
        author: 'John H.',
        date: '06/04/2022',
        nrLikes: 1,
        nrComments: 2,
      ),
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content: "CONTENT",
        author: 'John H.',
        date: '06/04/2022',
        nrLikes: 1,
        nrComments: 2,
      ),
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content: "CONTENT",
        author: 'John H.',
        date: '06/04/2022',
        nrLikes: 1,
        nrComments: 2,
      ),
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content: "CONTENT",
        author: 'John H.',
        date: '06/04/2022',
        nrLikes: 1,
        nrComments: 2,
      ),
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content: "CONTENT",
        author: 'John H.',
        date: '06/04/2022',
        nrLikes: 1,
        nrComments: 2,
      ),
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content: "CONTENT",
        author: 'John H.',
        date: '06/04/2022',
        nrLikes: 1,
        nrComments: 2,
      ),
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content: "CONTENT",
        author: 'John H.',
        date: '06/04/2022',
        nrLikes: 1,
        nrComments: 2,
      ),
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content: "CONTENT",
        author: 'John H.',
        date: '06/04/2022',
        nrLikes: 1,
        nrComments: 2,
      ),
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content: "CONTENT",
        author: 'John H.',
        date: '06/04/2022',
        nrLikes: 1,
        nrComments: 2,
      ),
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content: "CONTENT",
        author: 'John H.',
        date: '06/04/2022',
        nrLikes: 1,
        nrComments: 2,
      ),
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content: "CONTENT",
        author: 'John H.',
        date: '06/04/2022',
        nrLikes: 1,
        nrComments: 2,
      ),
      Post(
        id: 1,
        topic: "What do you think about Amazon Alexa?",
        content: "CONTENT",
        author: 'John H.',
        date: '06/04/2022',
        nrLikes: 1,
        nrComments: 2,
      ),
    ];
  }
}
