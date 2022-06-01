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
                print("E");
                if ((globals.checkedPopularM ||
                        globals.checkedCommentedM ||
                        globals.checkedRecentM ||
                        globals.searchedM != "") &&
                    (widget.from == "/post")) {
                  if (globals.searchedM != "") {
                    print("E1");
                    globals.isSearched = true;
                  } else {
                    print("E2");

                    globals.isSorted = true;
                  }
                } else {
                  print("E3");

                  globals.nrPrefferencesMyPost = 0;
                  globals.checkedCommentedM = false;
                  globals.checkedPopularM = false;
                  globals.checkedRecentM = false;
                  globals.searchedM = "";
                }
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (child) => const MyPosts()),
                    (route) => false);
                globals.isChanged = true;
              } else {
                print("D");
                if ((globals.checkedPopularH ||
                        globals.checkedCommentedH ||
                        globals.checkedRecentH ||
                        globals.searchedH != "") &&
                    (widget.from == "/post" || widget.from == "/myposts")) {
                  if (globals.searchedH != "") {
                    print("D1");
                    globals.isSearched = true;
                  } else {
                    print("D2");

                    globals.isSorted = true;
                  }
                  globals.isChanged = true;
                } else {
                  print("D3");

                  globals.isChanged = false;
                  globals.isSearched = false;
                  globals.searchedH = "";
                  globals.checkedCommentedH = false;
                  globals.checkedPopularH = false;
                  globals.checkedRecentH = false;
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
                  globals.searchedM != "") {
                if (widget.from == "/post") {
                  print("T1");

                  Navigator.of(context).pop();
                } else {
                  globals.nrPrefferencesMyPost = 0;

                  globals.checkedCommentedM = false;
                  globals.checkedPopularM = false;
                  globals.checkedRecentM = false;
                  globals.searchedM = "";
                  globals.isSearched = false;

                  print("T2");
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (child) => const MyPosts()),
                  );
                }
              } else if (globals.checkedCommentedH ||
                  globals.checkedPopularH ||
                  globals.checkedRecentH ||
                  globals.searchedH != "") {
                print(globals.searchedH);
                if (widget.from == "/createpost" ||
                    widget.from == "/post" ||
                    widget.from == "/myposts") {
                  print("T3");

                  Navigator.of(context).pop();
                } else {
                  print("T4");
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
                print("T5");

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
