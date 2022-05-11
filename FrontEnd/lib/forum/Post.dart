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
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          //
          //------------------------------------------------------- PHONE MODE --------------------------------------------------------------------------------------------

          if (constraints.maxWidth < 700) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CustomTitle(text: "Post"),
                ],
              ),
            );
          }

          //------------------------------------------------------- TABLET MODE --------------------------------------------------------------------------------------------

          else if (constraints.maxWidth < 1100) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CustomTitle(text: "Post"),
                ],
              ),
            );
          }

          //------------------------------------------------------- DESKTOP MODE --------------------------------------------------------------------------------------------

          else {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 0,
                          child: ButtonBack(
                              context: context, width: 40, height: 40),
                        ),
                        Expanded(
                          child: CustomTitle(text: "Post"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}

//------------------------------------------------------- METHODS --------------------------------------------------------------------------------------------
