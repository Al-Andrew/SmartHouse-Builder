import 'package:flutter/material.dart';
import 'package:homepage/forum/ForumHomePage.dart';
import 'package:homepage/forum/MyPosts.dart';
import 'package:homepage/forum/CreatePost.dart';
import 'package:homepage/forum/Post.dart';

import 'package:homepage/forum/ForumNestedNavigator.dart';

class Forum extends StatefulWidget {
  const Forum({Key? key}) : super(key: key);

  @override
  State<Forum> createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ForumNestedNavigator(
        forumNavigationKey: navigationKey,
        initialRoute: '/',
        routes: {
          // default rout as '/' is necessary!
          '/': (context) => ForumHomePage(),
          '/myposts': (context) => MyPosts(),
          '/createpost': (context) => CreatePost(),
          '/post': (context) => POST(),
        },
      ),
    );
  }
}
