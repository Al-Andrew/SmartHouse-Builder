import 'dart:html';
import 'package:homepage/forum/Forum.dart';
import 'package:homepage/forum/screens/ForumHomePage.dart';

import '../../ForumGlobals.dart' as globals;

import 'package:flutter/material.dart';
import 'package:homepage/forum/screens/CreatePost.dart';
import 'package:homepage/forum/classes/PostClass.dart';

import '../../screens/MyPosts.dart';

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
            if (route == '/') {
              globals.checkedCommentedH = checkedCommented;
              globals.checkedPopularH = checkedPopular;
              globals.checkedRecentH = checkedRecent;
            } else {
              globals.checkedCommentedM = checkedCommented;
              globals.checkedPopularM = checkedPopular;
              globals.checkedRecentM = checkedRecent;
            }
            Post.sortPosts(
                checkedRecent, checkedCommented, checkedPopular, route);
            // globals.isChanged = true;
            globals.isSorted = true;
            if (route == '/') {
              globals.nrPrefferencesHomePage++;
              print(globals.nrPrefferencesHomePage);
              if (globals.nrPrefferencesHomePage == 1) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (child) => ForumHomePage()));
              } else {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (child) => ForumHomePage()),
                );
              }
            } else {
              globals.nrPrefferencesMyPost++;

              if (globals.nrPrefferencesMyPost == 1) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (child) => const MyPosts()));
              } else {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (child) => const MyPosts()),
                );
              }
            }
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
