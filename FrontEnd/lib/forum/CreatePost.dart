import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/forum/Utilities.dart';

import 'package:homepage/forum/Utilities.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ButtonBack(context: context, width: 20, height: 20),
          CustomTitle(text: 'Create Post'),
        ],
      ),
    );
  }
}
