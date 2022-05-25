import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/forum/classes/PostClass.dart';
import 'package:homepage/forum/screens/ForumHomePage.dart';
import '../../ForumGlobals.dart' as globals;
import '../../screens/MyPosts.dart';
import '../PostsTable.dart';

class ButtonBack extends StatefulWidget {
  const ButtonBack({
    Key? key,
    required this.context,
    required this.width,
    required this.height,
    required this.route,
  }) : super(key: key);

  final BuildContext context;
  final double width;
  final double height;
  final String route;

  @override
  State<ButtonBack> createState() => _ButtonBackState();
}

class _ButtonBackState extends State<ButtonBack> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      height: widget.height,
      width: widget.width,
      child: Ink(
        child: IconButton(
          onPressed: () {
            if (globals.isChanged) {
              if (this.widget.route == '/myposts') {
                if (globals.checkedPopularM ||
                    globals.checkedCommentedM ||
                    globals.checkedRecentM) {
                  Post.sortPosts(
                      globals.checkedRecentM,
                      globals.checkedCommentedM,
                      globals.checkedPopularM,
                      widget.route);
                  globals.checkedCommentedM = false;
                  globals.checkedPopularM = false;
                  globals.checkedRecentM = false;
                } else {
                  globals.nrPrefferencesMyPost = 0;
                }
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (child) => const MyPosts()),
                    (route) => false);
                globals.isChanged = true;
              } else {
                if (globals.checkedPopularH ||
                    globals.checkedCommentedH ||
                    globals.checkedRecentH) {
                  Post.sortPosts(
                      globals.checkedRecentH,
                      globals.checkedCommentedH,
                      globals.checkedPopularH,
                      widget.route);
                  globals.checkedCommentedH = false;
                  globals.checkedPopularH = false;
                  globals.checkedRecentH = false;
                  globals.isChanged = true;
                } else {
                  globals.isChanged = false;
                  globals.nrPrefferencesHomePage = 0;
                  globals.nrPrefferencesMyPost = 0;
                }

                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (child) => ForumHomePage()),
                    (route) => false);
              }
            } else {
              if (globals.checkedCommentedM ||
                  globals.checkedPopularM ||
                  globals.checkedRecentM) {
                globals.checkedCommentedM = false;
                globals.checkedPopularM = false;
                globals.checkedRecentM = false;
                globals.nrPrefferencesMyPost = 0;
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (child) => MyPosts()),
                    (route) => false);
              } else if (globals.checkedCommentedH ||
                  globals.checkedPopularH ||
                  globals.checkedRecentH) {
                globals.checkedCommentedH = false;
                globals.checkedPopularH = false;
                globals.checkedRecentH = false;
                globals.nrPrefferencesHomePage = 0;
                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pop();
              }
            }
          },
          icon: Icon(Icons.arrow_back),
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 109, 184, 245),
              Color.fromARGB(255, 37, 108, 214),
            ],
          ),
        ),
      ),
    );
  }
}
