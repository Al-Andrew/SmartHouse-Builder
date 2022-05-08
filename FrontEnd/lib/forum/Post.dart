import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/forum/Utilities.dart';

class Post {
  String id;
  String topic;
  String author;
  String date;
  String likes;
  String comments;

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
          id: '1',
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: '1',
          comments: '2'),
      Post(
          id: '2',
          topic: "Need options on my first SmartHouse...",
          author: 'Andrewhhhhhhh J.',
          date: '06/04/2022',
          likes: '1',
          comments: '12'),
      Post(
          id: '3',
          topic:
              "Should I buy Amazon Alexa or it is better to buy the box from Apple? What do you think?",
          author: 'Elisabeth H.',
          date: '06/04/2022',
          likes: '1',
          comments: '2'),
      Post(
          id: '4',
          topic: "What do you think about Amazon Alexa?",
          author: 'Cristian H.',
          date: '06/04/2022',
          likes: '1',
          comments: '2'),
      Post(
          id: '5',
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: '1',
          comments: '2'),
      Post(
          id: '6',
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: '1',
          comments: '2'),
      Post(
          id: '7',
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: '1',
          comments: '2'),
      Post(
          id: '8',
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: '1',
          comments: '2'),
      Post(
          id: '9',
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: '1',
          comments: '2'),
      Post(
          id: '10',
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: '1',
          comments: '2'),
      Post(
          id: '11',
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: '1',
          comments: '2'),
      Post(
          id: '12',
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: '1',
          comments: '2'),
      Post(
          id: '13',
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: '1',
          comments: '2'),
      Post(
          id: '14',
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: '1',
          comments: '2'),
      Post(
          id: '15',
          topic: "What do you think about Amazon Alexa?",
          author: 'John H.',
          date: '06/04/2022',
          likes: '1',
          comments: '2'),
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
      child: CustomTitle(text: "Post PAGE"),
    );
  }
}
