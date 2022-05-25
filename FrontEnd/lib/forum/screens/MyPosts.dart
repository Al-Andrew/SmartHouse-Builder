import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/forum/utilities/Utilities.dart';
import '../ForumGlobals.dart' as globals;

import 'package:homepage/forum/classes/PostClass.dart';

import 'Post.dart';

//ButtonBack(context: context, width: 20, height: 20),
class MyPosts extends StatefulWidget {
  const MyPosts({Key? key}) : super(key: key);

  @override
  State<MyPosts> createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  late List<Post> selectedPosts;

  @override
  void initState() {
    if (globals.isSorted == false) {
      Post.getMyPosts(1).then(
        (value) {
          setState(() {
            globals.myPosts = value;
          });
        },
      );
    } else {
      globals.isSorted = false;
    }

    selectedPosts = [];
    super.initState();
  }

  onSelectedRow(bool selected, Post post) async {
    setState(() {
      if (selected) {
        selectedPosts.add(post);
      } else {
        selectedPosts.remove(post);
      }
    });
  }

  //functia pentru butonul remove
  deleteSelectedPosts() async {
    setState(() {
      Post.removePosts(selectedPosts);
      globals.isChanged = true;
    });
  }

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
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 0,
                          child: ButtonBack(
                            context: context,
                            width: 40,
                            height: 40,
                            route: '/',
                          ),
                        ),
                        Expanded(
                          child: CustomTitle(
                            text: "My Posts",
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SearchBar(),
                  Container(
                    height: 230,
                    child: Center(
                        child: CustomSort(
                            height: 230, width: 160, route: '/myposts')),
                  ),
                  Container(
                    child: Center(
                      child: MyPostsTable(30, 19, 250),
                    ),
                  ),
                  Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: GradientText(
                            'Selected ${selectedPosts.length}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Barlow Condensed',
                            ),
                            gradient: LinearGradient(colors: [
                              Colors.blue.shade400,
                              Colors.blue.shade900,
                            ]),
                          ),
                        ),
                        Center(
                          child: ButtonRemovePost(160, 45),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          //------------------------------------------------------- TABLET MODE --------------------------------------------------------------------------------------------

          else if (constraints.maxWidth < 1100) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
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
                            context: context,
                            width: 40,
                            height: 40,
                            route: '/',
                          ),
                        ),
                        Expanded(
                          child: CustomTitle(
                            text: "My Posts",
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SearchBar(),
                  Container(
                    height: 230,
                    child: Center(
                        child: CustomSort(
                            height: 230, width: 160, route: '/myposts')),
                  ),
                  Container(
                    child: Center(
                      child: MyPostsTable(30, 19, 250),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(30.0),
                        child: Center(
                          child: GradientText(
                            'Selected ${selectedPosts.length}',
                            style: const TextStyle(
                              fontSize: 20,
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
                      ButtonRemovePost(160, 45),
                    ],
                  ),
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
                            context: context,
                            width: 40,
                            height: 40,
                            route: '/',
                          ),
                        ),
                        Expanded(
                          child: CustomTitle(
                            text: "My Posts",
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SearchBar(),
                  Container(
                    height: 400,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10.0),
                                child: CustomSort(
                                  height: 230,
                                  width: 160,
                                  route: '/myPosts',
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10.0),
                                child: Center(
                                  child: GradientText(
                                    'Selected ${selectedPosts.length}',
                                    style: const TextStyle(
                                      fontSize: 20,
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
                              ButtonRemovePost(160, 45),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                              child: Center(
                            child: MyPostsTable(40, 20, 350),
                          )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }

//------------------------------------------------------- METHODS --------------------------------------------------------------------------------------------

// ------------------------------------------------------------------------BUTTONS

  Container ButtonRemovePost(double width, double height) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 245, 109, 109),
            Color.fromARGB(255, 214, 37, 37),
          ],
        ),
      ),
      child: ElevatedButton.icon(
        onPressed: selectedPosts.isEmpty
            ? null
            : () async {
                final isConfirmed = await _isDeletingDesired();
                if (isConfirmed == true) {
                  deleteSelectedPosts();
                } else {}
              },
        label: Text(
          "Remove",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        icon: Icon(
          Icons.delete,
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

// ------------------------------------------------------------------------Pop Up for Removing
  Future<bool> _isDeletingDesired() async {
    return await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                title: const Text('Are you sure?'),
                content: const Text(
                    'If you click yes, your selected posts will be deleted permanently.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('Close'),
                  ),
                ],
              );
            }) ??
        false;
  }
// ------------------------------------------------------------------------MY POSTS TABLE

  SingleChildScrollView MyPostsTable(
      double spaceBetweenColumns, double fontSize, double topicWidth) {
    return SingleChildScrollView(
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
              columnSpacing: spaceBetweenColumns,
              columns: [
                DataColumn(
                  numeric: false,
                  label: SizedBox(
                    width: 50,
                    child: Center(
                      child: Text('ID',
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                DataColumn(
                  numeric: false,
                  label: SizedBox(
                    width: topicWidth,
                    child: Center(
                      child: Text('TOPIC',
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                DataColumn(
                  numeric: false,
                  label: SizedBox(
                    width: 70,
                    child: Center(
                      child: Text('DATE',
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                DataColumn(
                  numeric: false,
                  label: Text('LIKES',
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                DataColumn(
                  numeric: false,
                  label: Text('COMMENTS',
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ],
              rows: globals.myPosts
                  .map(
                    (post) => DataRow(
                      //For checkboxes
                      selected: selectedPosts.contains(post),
                      onSelectChanged: (b) {
                        onSelectedRow(b!, post);
                      },
                      cells: [
                        DataCell(
                          Center(
                            child: Center(child: Text(post.id.toString())),
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            width: topicWidth,
                            child: Center(
                              child: TextButton(
                                child: Text(
                                  post.topic,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => POST(
                                              post: post,
                                              homeRoute: '/myposts',
                                            )),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(post.date),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(post.nrLikes.toString()),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(post.nrComments.toString()),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList()),
        ),
      ),
    );
  }
}
