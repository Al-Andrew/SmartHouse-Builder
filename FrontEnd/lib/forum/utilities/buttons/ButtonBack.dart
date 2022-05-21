import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/forum/classes/PostClass.dart';
import '../../ForumGlobals.dart' as globals;
import '../PostsTable.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({
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
      child: Ink(
        child: IconButton(
          onPressed: () {
            if (globals.isChanged) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false);
              globals.isChanged = false;
            } else
              Navigator.of(context).pop();
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
