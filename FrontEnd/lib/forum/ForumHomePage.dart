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
                    child: Center(
                      child: Container(
                        color: Colors.blue,
                        child: Center(child: Text('Forum')),
                      ),
                    ),
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
