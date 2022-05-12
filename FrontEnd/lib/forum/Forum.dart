import 'package:flutter/material.dart';
import 'package:homepage/forum/screens/CreatePost.dart';
import 'package:homepage/forum/screens/Post.dart';
import 'package:homepage/forum/screens/MyPosts.dart';
import 'package:homepage/forum/screens/ForumHomePage.dart';

class Forum extends StatefulWidget {
  const Forum({Key? key}) : super(key: key);

  @override
  State<Forum> createState() => _ForumState();
}

const routeForumHome = '/';
const routeMyPosts = '/myposts';
const routeCreatePost = '/createposts';
const routePost = '/post';

class _ForumState extends State<Forum> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        late Widget page;
        if (settings.name == routeForumHome) {
          page = ForumHomePage();
        } else if (settings.name == routeMyPosts) {
          page = const MyPosts();
        } else if (settings.name == routeCreatePost) {
          page = const CreatePost();
        } // else if (settings.name == routePost) {
        //   page = const POST();
        // }
        else {
          throw Exception('Unknown route: ${settings.name}');
        }

        return MaterialPageRoute<dynamic>(
          builder: (context) {
            return page;
          },
          settings: settings,
        );
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
