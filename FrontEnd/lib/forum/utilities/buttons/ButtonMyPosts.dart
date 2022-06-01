import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/forum/screens/MyPosts.dart';
import '../../ForumGlobals.dart' as globals;

class ButtonMyPosts extends StatelessWidget {
  const ButtonMyPosts({
    Key? key,
    required this.context,
    required this.width,
    required this.height,
  }) : super(key: key);

  final BuildContext context;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
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
}
