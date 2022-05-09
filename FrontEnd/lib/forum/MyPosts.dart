import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/forum/Utilities.dart';
import 'package:homepage/homepage.dart';
import 'package:homepage/main.dart';

class MyPosts extends StatefulWidget {
  const MyPosts({Key? key}) : super(key: key);

  @override
  State<MyPosts> createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Row(
        children: [
          ButtonBack(context: context, width: 20, height: 20),
          CustomTitle(text: 'My Posts'),
        ],
      ),
    ));
  }
}
