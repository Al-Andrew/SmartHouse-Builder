import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/forum/screens/CreatePost.dart';

class SortButton extends StatelessWidget {
  const SortButton({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

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
        onPressed: () {},
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
