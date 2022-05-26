import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/forum/classes/PostClass.dart';
import 'package:homepage/forum/screens/MyPosts.dart';
import '../screens/ForumHomePage.dart';
import '../screens/Post.dart';
import '../classes/PostClass.dart';
import '../ForumGlobals.dart' as globals;

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    required this.route,
  }) : super(key: key);

  final String route;

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
                  hintText: 'Search',
                  prefixIcon: IconButton(
                    padding: EdgeInsets.only(bottom: 2.0),
                    icon: Icon(Icons.search, size: 30.0),
                    onPressed: () {
                      if (SearchController.text.isNotEmpty) {
                        globals.isSorted = false;
                        globals.isSearched = true;
                        if (widget.route == "/") {
                          globals.checkedCommentedH = false;
                          globals.checkedPopularH = false;
                          globals.checkedRecentH = false;
                          globals.nrPrefferencesHomePage++;
                          globals.searchedH = SearchController.text;
                          if (globals.nrPrefferencesHomePage == 1) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (child) => ForumHomePage()));
                          } else {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (child) => ForumHomePage()),
                            );
                          }
                        } else if (widget.route == "/myposts") {
                          globals.checkedCommentedM = false;
                          globals.checkedPopularM = false;
                          globals.checkedRecentM = false;
                          globals.nrPrefferencesMyPost++;
                          globals.searchedM = SearchController.text;

                          if (globals.nrPrefferencesMyPost == 1) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (child) => const MyPosts()));
                          } else {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (child) => const MyPosts()),
                            );
                          }
                        }
                      }
                    },
                  ),
                  suffixIcon: IconButton(
                    padding: EdgeInsets.only(bottom: 1.0),
                    icon: Icon(Icons.close, size: 25.0),
                    onPressed: () {
                      SearchController.clear();
                    },
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter text';
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
