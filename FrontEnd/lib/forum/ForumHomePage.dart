import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/forum/GradientText.dart';
import 'package:homepage/forum/SearchBar.dart';
import 'package:homepage/forum/PostsTabel.dart';

class Forum extends StatefulWidget {
  Forum();

  @override
  State<Forum> createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Container(
                child: Center(
                  child: GradientText(
                    'Forum',
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Barlow Condensed',
                    ),
                    gradient: LinearGradient(colors: [
                      Colors.blue.shade400,
                      Colors.blue.shade900,
                    ]),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SearchBar(),
            ),
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          height: 40,
                          width: 125,
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
                            onPressed: () {},
                            label: Text(
                              'New Post',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            icon: Icon(Icons.add),
                            style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                ),
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          height: 40,
                          width: 125,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 109, 184, 245),
                                Color.fromARGB(255, 37, 108, 214),
                              ],
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                ),
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            child: Text(
                              'My Posts',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          margin: const EdgeInsets.only(top: 10.0),
                          child: Center(child: Text('Filter')),
                        ),
                      ],
                    )),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      child: Center(child: PostsTabel()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
