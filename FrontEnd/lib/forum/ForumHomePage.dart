import 'dart:html';

import 'package:flutter/material.dart';
import 'Utilities.dart';
import 'package:homepage/forum/MyPosts.dart';
import 'package:homepage/forum/CreatePost.dart';
import 'package:homepage/main.dart';

class ForumHomePage extends StatefulWidget {
  ForumHomePage();

  @override
  State<ForumHomePage> createState() => _ForumHomePageState();
}

class _ForumHomePageState extends State<ForumHomePage> {
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
                  CustomTitle(text: "Forum"),
                  SearchBar(),
                  Container(
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(child: CustomSort(height: 180, width: 160)),
                        Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 35.0),
                                child: Column(
                                  children: [
                                    ButtonNewPost(160, 45),
                                    ButtonMyPosts(160, 45),
                                  ],
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Center(
                        child: PostsTabel(
                      spaceBetweenColumns: 20,
                      fontSize: 17,
                      topicWidth: 150,
                      authorWidth: 75,
                    )),
                  ),
                ],
              ),
            );
          }

          //------------------------------------------------------- TABLET MODE --------------------------------------------------------------------------------------------

          else if (constraints.maxWidth < 1100) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CustomTitle(text: "Forum"),
                  SearchBar(),
                  Container(
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(child: CustomSort(height: 180, width: 160)),
                        Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                child: Column(
                                  children: [
                                    ButtonNewPost(160, 45),
                                    ButtonMyPosts(160, 45),
                                  ],
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Center(
                        child: PostsTabel(
                      spaceBetweenColumns: 30,
                      fontSize: 19,
                      topicWidth: 250,
                      authorWidth: 100,
                    )),
                  ),
                ],
              ),
            );
          }

          //------------------------------------------------------- DESKTOP MODE --------------------------------------------------------------------------------------------

          else {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CustomTitle(text: "Forum"),
                  SearchBar(),
                  Container(
                    height: 400,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              ButtonNewPost(160, 45),
                              ButtonMyPosts(160, 45),
                              Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                child: CustomSort(height: 180, width: 160),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            child: Center(
                                child: PostsTabel(
                              spaceBetweenColumns: 40,
                              fontSize: 20,
                              topicWidth: 350,
                              authorWidth: 125,
                            )),
                          ),
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

//------------------------------------------------------- METHODS --------------------------------------------------------------------------------------------

// ------------------------------------------------------------------------BUTTONS

  Container ButtonMyPosts(double width, double height) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 109, 184, 245),
            Color.fromARGB(255, 37, 108, 214),
          ],
        ),
      ),
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (child) => const MyPosts()),
          );
        },
        label: Text(
          "My Posts",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        icon: Icon(
          Icons.list,
          color: Colors.black,
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

  Container ButtonNewPost(double width, double height) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 109, 184, 245),
            Color.fromARGB(255, 37, 108, 214),
          ],
        ),
      ),
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreatePost()),
          );
        },
        label: Text(
          "New Post",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        icon: Icon(
          Icons.add,
          color: Colors.black,
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
