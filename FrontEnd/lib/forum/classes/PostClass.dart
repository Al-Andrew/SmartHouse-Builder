import 'dart:html';
import 'dart:io';

import 'package:homepage/global_variables.dart';

import './CommentClass.dart';
import './ReportClass.dart';
import './Tags.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../ForumGlobals.dart' as globals;

class Post {
  int id;
  int id_user;
  String topic;
  String content;
  String author;
  String date;
  int nrLikes;
  int nrComments = 0;
  List<String> tags;
  List<Comment> comments;
  List<Report> reports;
  Tags tags_integers;

  Post({
    required this.id,
    required this.id_user,
    required this.topic,
    required this.content,
    required this.author,
    required this.date,
    required this.tags_integers,
    required this.comments,
    required this.reports,
    required this.tags,
    required this.nrLikes,
  });

  factory Post.fromJson(dynamic json) {
    return Post(
        id: json["id"],
        id_user: json["id_user"],
        date: json["date"],
        topic: json["title"],
        content: json["content"],
        author: "Default Author",
        tags: [],
        comments: [],
        reports: [],
        tags_integers: new Tags(
            id: 0,
            flagHard: 0,
            flagQuestion: 0,
            flagReview: 0,
            flagSetup: 0,
            flagSoft: 0),
        nrLikes: json["numberLikes"]);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'id_user': id_user,
        'title': topic,
        'content': content,
        'author': author,
        'date': date,
        'tags': tags_integers,
        'comments': comments,
        'numberLikes': nrLikes
      };
  static void setTags(Post post) {
    if (post.tags_integers.flagHard == 1) {
      //print("hard");
      post.tags.add("Hardware");
    }
    if (post.tags_integers.flagQuestion == 1) {
      //print("ques");
      post.tags.add("Question");
    }
    if (post.tags_integers.flagReview == 1) {
      //print("rev");
      post.tags.add("Review");
    }
    if (post.tags_integers.flagSetup == 1) {
      //print("set");
      post.tags.add("Setup");
    }
    if (post.tags_integers.flagSoft == 1) {
      // print("soft");
      post.tags.add("Software");
    }
  }

  void addComment(int id, int id_user, int id_post, String content,
      String author, String date, int nrLikes) {
    Comment comment = new Comment(
        id: id,
        id_user: id_user,
        id_post: id_post,
        content: content,
        author: author,
        date: date);
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
    Post newPost = new Post(
        id: id,
        id_user: id_author,
        topic: title,
        content: content,
        author: author,
        date: date,
        comments: <Comment>[],
        reports: <Report>[],
        tags_integers: tags,
        tags: <String>[],
        nrLikes: 0);
    print(newPost);

    Post.setTags(newPost);
    globals.posts.add(newPost);
    print(newPost.tags);
    print(jsonEncode(newPost));

    var body = jsonEncode({
      "id_user": newPost.id_user,
      "title": newPost.topic,
      "date": newPost.date,
      "content": newPost.content,
      "author": newPost.author,
      "comments": [],
      "reports": [],
      "tags": {
        "id": newPost.id,
        "reviewFlag": newPost.tags_integers.flagReview,
        "questionFlag": newPost.tags_integers.flagQuestion,
        "setupFlag": newPost.tags_integers.flagSetup,
        "hardwareFlag": newPost.tags_integers.flagHard,
        "softwareFlag": newPost.tags_integers.flagSoft
      }
    });
    print(body);
    var response = http.post(
        Uri.parse(
          'https://smart-house-builder.azurewebsites.net/api/forum',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    print(response.toString());
  }

  void removeComment(Comment comment) {
    comments.remove(comment);
    int idCopy = comment.id;
    print(idCopy);
    http.delete(Uri.parse(
        'https://smart-house-builder.azurewebsites.net/api/forum/comment/$idCopy'));
  }

  static Future<List<Post>> getSearchedPosts(String route) async {
    String searchedPost;
    if (route == '/') {
      searchedPost = globals.searchedH;
    } else {
      searchedPost = globals.searchedM;
    }
    print(searchedPost);
    if (route == "/myposts") {
      globals.isSearched = true;
      final uri = Uri.http('smart-house-builder.azurewebsites.net',
          '/api/forum/search/$userID/$searchedPost');
      print("Z1");
      final response = await http.get(uri);
      var jsonData = json.decode(response.body);
      List<Post> posts = [];
      for (var v in jsonData) {
        Post postare = Post.fromJson(v);

        int postId = Post.fromJson(v).id;
        int idAuthor = Post.fromJson(v).id_user;
        print("Z2");

        final responseA = await http.get(
            Uri.parse(
                'https://smart-house-builder.azurewebsites.net/api/user/nameUser/$idAuthor'),
            headers: {"Access-Control-Allow-Origin": "*"});
        if (responseA.statusCode == 200) {
          postare.author = responseA.body;
        } else
          postare.author = "Default Author";
        print("Z3");

        final response2 = await http.get(
            Uri.parse(
              'https://smart-house-builder.azurewebsites.net/api/forum/comment/$postId',
            ),
            headers: {"Access-Control-Allow-Origin": "*"});
        for (var comment in jsonDecode(response2.body)) {
          Comment com = Comment.fromJson(comment);
          int idAuthor = Comment.fromJson(comment).id_user;
          final responseA = await http.get(
              Uri.parse(
                  'https://smart-house-builder.azurewebsites.net/api/user/nameUser/$idAuthor'),
              headers: {"Access-Control-Allow-Origin": "*"});
          if (responseA.statusCode == 200) {
            com.author = responseA.body;
          } else
            com.author = "Default Author";
          postare.comments.add(com);
        }
        postare.nrComments = postare.comments.length;
        final response3 = await http.get(
            Uri.parse(
              'https://smart-house-builder.azurewebsites.net/api/forum/tags/$postId',
            ),
            headers: {"Access-Control-Allow-Origin": "*"});
        var tag = jsonDecode(response3.body);
        postare.tags_integers = Tags.fromJson(tag);
        Post.setTags(postare);
        posts.add(postare);
      }
      return posts;
    } else {
      globals.isSearched = true;
      final uri = Uri.https('smart-house-builder.azurewebsites.net',
          '/api/forum/search/$searchedPost');

      final response = await http.get(uri);
      var jsonData = json.decode(response.body);
      List<Post> posts = [];
      for (var v in jsonData) {
        print("1D");
        Post postare = Post.fromJson(v);

        int postId = Post.fromJson(v).id;
        int idAuthor = Post.fromJson(v).id_user;
        final responseA = await http.get(
            Uri.parse(
                'https://smart-house-builder.azurewebsites.net/api/user/nameUser/$idAuthor'),
            headers: {"Access-Control-Allow-Origin": "*"});
        print("2D");

        if (responseA.statusCode == 200) {
          postare.author = responseA.body;
        } else
          postare.author = "Default Author";
        final response2 = await http.get(
            Uri.parse(
              'https://smart-house-builder.azurewebsites.net/api/forum/comment/$postId',
            ),
            headers: {"Access-Control-Allow-Origin": "*"});
        for (var comment in jsonDecode(response2.body)) {
          Comment com = Comment.fromJson(comment);
          int idAuthor = Comment.fromJson(comment).id_user;

          final responseA = await http.get(
              Uri.parse(
                  'https://smart-house-builder.azurewebsites.net/api/user/nameUser/$idAuthor'),
              headers: {"Access-Control-Allow-Origin": "*"});
          if (responseA.statusCode == 200) {
            com.author = responseA.body;
          } else
            com.author = "Default Author";
          postare.comments.add(com);
        }
        postare.nrComments = postare.comments.length;
        final response3 = await http.get(
            Uri.parse(
              'https://smart-house-builder.azurewebsites.net/api/forum/tags/$postId',
            ),
            headers: {"Access-Control-Allow-Origin": "*"});
        var tag = jsonDecode(response3.body);
        postare.tags_integers = Tags.fromJson(tag);
        print("3D");

        Post.setTags(postare);
        posts.add(postare);
      }
      return posts;
    }
  }

  static Future<List<Post>> sortPosts(String route) async {
    bool checkedRecent;
    bool checkedCommented;
    bool checkedPopular;
    if (route == "/") {
      checkedRecent = globals.checkedRecentH;
      checkedCommented = globals.checkedCommentedH;
      checkedPopular = globals.checkedPopularH;
    } else {
      checkedRecent = globals.checkedRecentM;
      checkedCommented = globals.checkedCommentedM;
      checkedPopular = globals.checkedPopularM;
    }
    final queryParameters = {
      'Date': '$checkedRecent',
      'Comments': '$checkedCommented',
      'Popular': '$checkedPopular'
    };

    if (route == "/myposts") {
      globals.isSorted = true;
      final uri = Uri.https('smart-house-builder.azurewebsites.net',
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
        int idAuthor = Post.fromJson(v).id_user;
        final responseA = await http.get(
            Uri.parse(
                'https://smart-house-builder.azurewebsites.net/api/user/nameUser/$idAuthor'),
            headers: {"Access-Control-Allow-Origin": "*"});
        if (responseA.statusCode == 200) {
          postare.author = responseA.body;
        } else
          postare.author = "Default Author";
        print(postare.id);
        final response2 = await http.get(
            Uri.parse(
              'https://smart-house-builder.azurewebsites.net/api/forum/comment/$postId',
            ),
            headers: {"Access-Control-Allow-Origin": "*"});
        for (var comment in jsonDecode(response2.body)) {
          Comment com = Comment.fromJson(comment);
          int idAuthor = Comment.fromJson(comment).id_user;
          final responseA = await http.get(
              Uri.parse(
                  'https://smart-house-builder.azurewebsites.net/api/user/nameUser/$idAuthor'),
              headers: {"Access-Control-Allow-Origin": "*"});
          if (responseA.statusCode == 200) {
            com.author = responseA.body;
          } else
            com.author = "Default Author";
          postare.comments.add(com);
        }
        postare.nrComments = postare.comments.length;
        final response3 = await http.get(
            Uri.parse(
              'https://smart-house-builder.azurewebsites.net/api/forum/tags/$postId',
            ),
            headers: {"Access-Control-Allow-Origin": "*"});
        var tag = jsonDecode(response3.body);
        postare.tags_integers = Tags.fromJson(tag);
        Post.setTags(postare);
        posts.add(postare);
      }
      return posts;
    } else {
      globals.isSorted = true;
      final uri = Uri.https('smart-house-builder.azurewebsites.net',
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
        print(postare.id);
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
        final response3 = await http.get(
            Uri.parse(
              'https://smart-house-builder.azurewebsites.net/api/forum/tags/$postId',
            ),
            headers: {"Access-Control-Allow-Origin": "*"});
        var tag = jsonDecode(response3.body);
        postare.tags_integers = Tags.fromJson(tag);
        Post.setTags(postare);

        posts.add(postare);
      }
      return posts;
    }
  }

  void addReport(int id, int id_author, int id_post, String title,
      String motivation, String date) {
    Report report = new Report(
      id: id,
      id_author: id_author,
      id_post: id_post,
      title: title,
      motivation: motivation,
      date: date,
    );
    reports.add(report);
    var headers = {
      HttpHeaders.authorizationHeader: 'Token $String',
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    http.post(
        Uri.parse(
          'https://smart-house-builder.azurewebsites.net/api/forum/report',
        ),
        headers: headers,
        body: json.encode(report));
  }

  static void removePosts(List<Post> selectedPosts, List<Post> posts) {
    if (selectedPosts.isNotEmpty) {
      List<Post> tmp = [];
      tmp.addAll(selectedPosts);
      for (Post post in tmp) {
        int idCopy = post.id;
        http.delete(Uri.parse(
            'https://smart-house-builder.azurewebsites.net/api/forum/$idCopy'));
        globals.myPosts.remove(post);
        posts.remove(post);
        selectedPosts.remove(post);
      }
    }
  }

  void setNrLikes(int newNrLikes) {
    this.nrLikes = newNrLikes;
    int id = this.id;
    final queryParameters = {
      'nbLikes': '$newNrLikes',
      'idPost': '$id',
    };
    final uri = Uri.https('smart-house-builder.azurewebsites.net',
        '/api/forum/updateLikes', queryParameters);
    var headers = {
      HttpHeaders.authorizationHeader: 'Token $String',
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    http.put(uri, headers: headers);
  }

  static Future<List<Post>> getPosts() async {
    final response = await http.get(
        Uri.parse(
          'https://smart-house-builder.azurewebsites.net/api/forum',
        ),
        headers: {"Access-Control-Allow-Origin": "*"});

    List<Post> posts = [];
    var jsonData = json.decode(response.body);
    for (var v in jsonData) {
      Post postare = Post.fromJson(v);
      int postId = Post.fromJson(v).id;
      int idAuthor = Post.fromJson(v).id_user;
      print(idAuthor);
      final responseA = await http.get(
          Uri.parse(
              'https://smart-house-builder.azurewebsites.net/api/user/nameUser/$idAuthor'),
          headers: {"Access-Control-Allow-Origin": "*"});
      if (responseA.statusCode == 200) {
        postare.author = responseA.body;
      } else
        postare.author = "Default Author";

      final response2 = await http.get(
          Uri.parse(
            'https://smart-house-builder.azurewebsites.net/api/forum/comment/$postId',
          ),
          headers: {"Access-Control-Allow-Origin": "*"});
      for (var comment in jsonDecode(response2.body)) {
        Comment com = Comment.fromJson(comment);
        int idAuthor = Comment.fromJson(comment).id_user;
        final responseA = await http.get(
            Uri.parse(
                'https://smart-house-builder.azurewebsites.net/api/user/nameUser/$idAuthor'),
            headers: {"Access-Control-Allow-Origin": "*"});
        if (responseA.statusCode == 200) {
          com.author = responseA.body;
        } else
          com.author = "Default Author";
        postare.comments.add(com);
        if (com.id >= globals.nextIdComment) {
          globals.nextIdComment = com.id;
        }
      }
      postare.nrComments = postare.comments.length;
      final response3 = await http.get(
          Uri.parse(
            'https://smart-house-builder.azurewebsites.net/api/forum/tags/$postId',
          ),
          headers: {"Access-Control-Allow-Origin": "*"});
      var tag = jsonDecode(response3.body);
      postare.tags_integers = Tags.fromJson(tag);
      Post.setTags(postare);
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
      int idAuthor = Post.fromJson(v).id_user;
      final responseA = await http.get(
          Uri.parse(
              'https://smart-house-builder.azurewebsites.net/api/user/nameUser/$idAuthor'),
          headers: {"Access-Control-Allow-Origin": "*"});
      if (responseA.statusCode == 200) {
        postHere.author = responseA.body;
      } else
        postHere.author = "Default Author";
      final response2 = await http.get(
          Uri.parse(
            'https://smart-house-builder.azurewebsites.net/api/forum/comment/$postId',
          ),
          headers: {"Access-Control-Allow-Origin": "*"});
      for (var comment in jsonDecode(response2.body)) {
        Comment com = Comment.fromJson(comment);
        int idAuthor = Comment.fromJson(comment).id_user;
        final responseA = await http.get(
            Uri.parse(
                'https://smart-house-builder.azurewebsites.net/api/user/nameUser/$idAuthor'),
            headers: {"Access-Control-Allow-Origin": "*"});
        if (responseA.statusCode == 200) {
          com.author = responseA.body;
        } else
          com.author = "Default Author";
        postHere.comments.add(com);
      }
      postHere.nrComments = postHere.comments.length;
      final response3 = await http.get(
          Uri.parse(
            'https://smart-house-builder.azurewebsites.net/api/forum/tags/$postId',
          ),
          headers: {"Access-Control-Allow-Origin": "*"});
      var tag = jsonDecode(response3.body);
      postHere.tags_integers = Tags.fromJson(tag);
      Post.setTags(postHere);
      posts.add(postHere);
    }

    return posts;
  }
}
