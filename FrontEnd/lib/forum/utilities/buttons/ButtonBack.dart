import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/forum/classes/PostClass.dart';
import '../../ForumGlobals.dart' as globals;
import '../PostsTable.dart';

class ButtonBack extends StatefulWidget {
  const ButtonBack({
    Key? key,
    required this.context,
    required this.width,
    required this.height,
    required this.route,
  }) : super(key: key);

  final BuildContext context;
  final double width;
  final double height;
  final String route;

  @override
  State<ButtonBack> createState() => _ButtonBackState();
}

class _ButtonBackState extends State<ButtonBack> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      height: widget.height,
      width: widget.width,
      child: Ink(
        child: IconButton(
          onPressed: () {
            if (globals.isChanged) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(this.widget.route, (route) => false);
              if (this.widget.route == '/myposts') {
                globals.isChanged = true;
              } else {
                globals.isChanged = false;
              }
            } else {
              Navigator.of(context).pop();
            }
          },
          icon: Icon(Icons.arrow_back),
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 109, 184, 245),
              Color.fromARGB(255, 37, 108, 214),
            ],
          ),
        ),
      ),
    );
  }
}
