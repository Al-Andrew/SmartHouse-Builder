import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/forum/Utilities.dart';
import 'package:homepage/homepage.dart';
import 'package:homepage/main.dart';

import 'Post.dart';

class MyPosts extends StatefulWidget {
  const MyPosts({Key? key}) : super(key: key);

  @override
  State<MyPosts> createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
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
                  CustomTitle(text: "My Posts"),
                  SearchBar(),
                ],
              ),
            );
          }

          //------------------------------------------------------- TABLET MODE --------------------------------------------------------------------------------------------

          else if (constraints.maxWidth < 1100) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CustomTitle(text: "My Posts"),
                  SearchBar(),
                ],
              ),
            );
          }

          //------------------------------------------------------- DESKTOP MODE --------------------------------------------------------------------------------------------

          else {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 0,
                          child: ButtonBack(
                              context: context, width: 40, height: 40),
                        ),
                        Expanded(
                          child: CustomTitle(text: "My Posts"),
                        ),
                      ],
                    ),
                  ),
                  SearchBar(),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}

//------------------------------------------------------- METHODS --------------------------------------------------------------------------------------------
