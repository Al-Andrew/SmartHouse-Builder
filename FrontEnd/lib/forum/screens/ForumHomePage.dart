import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/forum/utilities/Utilities.dart';
import 'package:homepage/forum/screens/MyPosts.dart';
import 'package:homepage/forum/screens/CreatePost.dart';
import '../ForumGlobals.dart' as globals;
import 'package:homepage/main.dart';

class ForumHomePage extends StatefulWidget {
  ForumHomePage();

  @override
  State<ForumHomePage> createState() {
    return _ForumHomePageState();
  }
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
                  CustomTitle(
                    text: "Forum",
                    fontSize: 35,
                  ),
                  SearchBar(),
                  Container(
                    height: 230,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                            child: CustomSort(
                                height: 230, width: 160, route: '/')),
                        Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 35.0),
                                child: Column(
                                  children: [
                                    ButtonNewPost(
                                        context: context,
                                        width: 160,
                                        height: 45),
                                    ButtonMyPosts(
                                        context: context,
                                        width: 160,
                                        height: 45),
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
                      fontSizeColumn: 17,
                      fontSizeRow: 13,
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
                  CustomTitle(
                    text: "Forum",
                    fontSize: 35,
                  ),
                  SearchBar(),
                  Container(
                    height: 230,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                            child: CustomSort(
                                height: 230, width: 160, route: '/')),
                        Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 35.0),
                                child: Column(
                                  children: [
                                    ButtonNewPost(
                                        context: context,
                                        width: 160,
                                        height: 45),
                                    ButtonMyPosts(
                                        context: context,
                                        width: 160,
                                        height: 45),
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
                      fontSizeColumn: 19,
                      fontSizeRow: 14,
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
                  CustomTitle(
                    text: "Forum",
                    fontSize: 35,
                  ),
                  SearchBar(),
                  Container(
                    height: 400,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              ButtonNewPost(
                                  context: context, width: 160, height: 45),
                              ButtonMyPosts(
                                  context: context, width: 160, height: 45),
                              Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                child: CustomSort(
                                  height: 230,
                                  width: 160,
                                  route: '/',
                                ),
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
                              fontSizeColumn: 20,
                              fontSizeRow: 15,
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
}
