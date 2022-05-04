import 'dart:html';

import 'package:flutter/material.dart';

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
              child: Container(
                child: Center(child: Text('Forum')),
                color: Colors.yellow,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Center(child: Text('Forum')),
                color: Colors.purple,
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        color: Colors.orange,
                        child: Column(
                          children: [
                            ButtonBar(
                                buttonPadding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        textStyle: const TextStyle(
                                            color: Colors.black)),
                                    onPressed: () => {
                                      //do something
                                    },
                                    child: const Center(
                                      child: Text('New Post'),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        textStyle: const TextStyle(
                                            color: Colors.black)),
                                    onPressed: () => {
                                      //do something
                                    },
                                    child: const Center(
                                      child: Text('My Posts'),
                                    ),
                                  ),
                                ]),
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
                      color: Colors.red,
                      child: Center(child: Text('Forum')),
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
