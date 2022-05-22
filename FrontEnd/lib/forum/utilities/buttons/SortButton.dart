import 'dart:html';
import '../../ForumGlobals.dart' as globals;

import 'package:flutter/material.dart';
import 'package:homepage/forum/screens/CreatePost.dart';
import 'package:homepage/forum/classes/PostClass.dart';

class SortButton extends StatelessWidget {
  SortButton({
    Key? key,
    required this.width,
    required this.height,
    required this.checkedRecent,
    required this.checkedPopular,
    required this.checkedCommented,
    required this.route,
  }) : super(key: key);

  final double width;
  final double height;
  bool checkedRecent;
  bool checkedPopular;
  bool checkedCommented;
  String route;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color.fromARGB(255, 53, 205, 255),
      ),
      child: ElevatedButton(
        onPressed: () {
          if (checkedCommented || checkedPopular || checkedRecent) {
            globals.isChanged = true;
            globals.isSorted = true;
            Post.sortPosts(
                checkedRecent, checkedCommented, checkedPopular, '/myposts');
          }
        },
        child: Text(
          "Sort",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        style: ElevatedButton.styleFrom(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            ),
            primary: Colors.transparent,
            shadowColor: Colors.transparent),
      ),
    );
  }
}
