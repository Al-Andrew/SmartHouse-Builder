import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/forum/classes/PostClass.dart';
import '../screens/Post.dart';
import '../ForumGlobals.dart' as globals;

class SearchBar extends StatefulWidget {
  SearchBar();

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final SearchController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    SearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      height: 100,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Material(
              borderRadius: BorderRadius.circular(30.0),
              elevation: 20.0,
              shadowColor: Colors.blue,
              child: TextFormField(
                controller:
                    SearchController, //am adaugat si avem textul cu SearchController.text
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(width: 2.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                        width: 1.3, color: Theme.of(context).primaryColor),
                  ),
                  prefix: Icon(Icons.square, color: Colors.transparent),
                  hintText: 'Search',
                  // prefixIcon: Icon(Icons.search, size: 30.0),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search, size: 30.0),
                    onPressed: () {
                      globals.isSorted = true;
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
