import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/forum/Utilities.dart';

class Post {
  int id;
  String topic;
  String author;
  String date;
  int likes;
  int comments;

  Post({
    required this.id,
    required this.topic,
    required this.author,
    required this.date,
    required this.likes,
    required this.comments,
  });

  static List<Post> getPosts() {
    return <Post>[
      Post(
          id: 1,
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: 1,
          comments: 2),
      Post(
          id: 1,
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: 1,
          comments: 2),
      Post(
          id: 1,
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: 1,
          comments: 2),
      Post(
          id: 1,
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: 1,
          comments: 2),
      Post(
          id: 1,
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: 1,
          comments: 2),
      Post(
          id: 1,
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: 1,
          comments: 2),
      Post(
          id: 1,
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: 1,
          comments: 2),
      Post(
          id: 1,
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: 1,
          comments: 2),
      Post(
          id: 1,
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: 1,
          comments: 2),
      Post(
          id: 1,
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: 1,
          comments: 2),
      Post(
          id: 1,
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: 1,
          comments: 2),
      Post(
          id: 1,
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: 1,
          comments: 2),
      Post(
          id: 1,
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: 1,
          comments: 2),
      Post(
          id: 1,
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: 1,
          comments: 2),
      Post(
          id: 1,
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: 1,
          comments: 2),
      Post(
          id: 1,
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: 1,
          comments: 2),
      Post(
          id: 1,
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: 1,
          comments: 2),
    ];
  }
}

class POST extends StatefulWidget {
  const POST({Key? key}) : super(key: key);

  @override
  State<POST> createState() => _POSTState();
}

class _POSTState extends State<POST> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ButtonBack(context: context, width: 20, height: 20),
          CustomTitle(text: 'Post'),
        ],
      ),
    );
  }
}
