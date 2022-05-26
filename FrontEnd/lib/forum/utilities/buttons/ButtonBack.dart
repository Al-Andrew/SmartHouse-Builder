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
    required this.from,
  }) : super(key: key);

  final BuildContext context;
  final double width;
  final double height;
  final String route;
  final String from;

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
                    globals.checkedRecentM ||
                    globals.searchedM.isNotEmpty) {
                  globals.isSorted = true;
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
                    globals.checkedRecentH ||
                    globals.searchedH.isNotEmpty) {
                  globals.isSorted = true;
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
                  globals.checkedRecentM ||
                  globals.searchedM.isNotEmpty) {
                print(globals.searchedM);
                if (widget.from == "/post") {
                  Navigator.of(context).pop();
                } else {
                  if (globals.searchedM.isEmpty) {
                    globals.checkedCommentedM = false;
                    globals.checkedPopularM = false;
                    globals.checkedRecentM = false;
                  } else {
                    globals.searchedM = "";
                    globals.isSearched = false;
                  }
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (child) => const MyPosts()),
                      (route) => false);
                }
              } else if (globals.checkedCommentedH ||
                  globals.checkedPopularH ||
                  globals.checkedRecentH ||
                  globals.searchedH.isNotEmpty) {
                print(globals.searchedH);
                if (widget.from == "/createpost" || widget.from == "/post") {
                  Navigator.of(context).pop();
                } else if (widget.from == "/myposts") {
                  print("3000");

                  globals.nrPrefferencesMyPost = 0;
                  if (globals.searchedH.isNotEmpty) {
                    globals.isSearched = true;
                  } else {
                    globals.isSorted = true;
                  }
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (child) => ForumHomePage()),
                      (route) => false);
                } else {
                  print("4000");
                  globals.checkedCommentedH = false;
                  globals.checkedPopularH = false;
                  globals.checkedRecentH = false;
                  globals.nrPrefferencesHomePage = 0;
                  globals.searchedH = "";
                  globals.isSearched = false;
                  globals.isSorted = false;
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (child) => ForumHomePage()),
                      (route) => false);
                }
              } else {
                print("3000");

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
