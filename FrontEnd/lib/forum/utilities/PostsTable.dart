import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/forum/classes/PostClass.dart';
import '../screens/Post.dart';
import '../ForumGlobals.dart' as globals;

class PostsTabel extends StatefulWidget {
  const PostsTabel({
    Key? key,
    required this.spaceBetweenColumns,
    required this.fontSizeColumn,
    required this.fontSizeRow,
    required this.topicWidth,
    required this.authorWidth,
  }) : super(key: key);

  final double spaceBetweenColumns;
  final double fontSizeColumn;
  final double fontSizeRow;
  final double topicWidth;
  final double authorWidth;

  @override
  State<PostsTabel> createState() {
    return _PostsTabelState();
  }
}

class _PostsTabelState extends State<PostsTabel> {
  @override
  void initState() {
    super.initState();
  }

  @override
  FutureBuilder build(BuildContext context) {
    return FutureBuilder(
        future: Post.getPosts(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return PostsTableBody(snapshot.data, context);
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  SingleChildScrollView PostsTableBody(List<Post> posts, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Center(
        child: SingleChildScrollView(
          child: DataTable(
              columnSpacing: widget.spaceBetweenColumns,
              columns: [
                DataColumn(
                  label: SizedBox(
                    width: 50,
                    child: Center(
                      child: Text('ID',
                          style: TextStyle(
                            fontSize: widget.fontSizeColumn,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: widget.topicWidth,
                    child: Center(
                      child: Text('TOPIC',
                          style: TextStyle(
                            fontSize: widget.fontSizeColumn,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: widget.authorWidth,
                    child: Center(
                      child: Text('AUTHOR',
                          style: TextStyle(
                            fontSize: widget.fontSizeColumn,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 70,
                    child: Center(
                      child: Text('DATE',
                          style: TextStyle(
                            fontSize: widget.fontSizeColumn,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                DataColumn(
                  label: Text('LIKES',
                      style: TextStyle(
                        fontSize: widget.fontSizeColumn,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                DataColumn(
                  label: Text('COMMENTS',
                      style: TextStyle(
                        fontSize: widget.fontSizeColumn,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ],
              rows: posts
                  .map(
                    (post) => DataRow(
                      cells: [
                        DataCell(
                          Center(
                            child: Center(
                                child: Text(
                              post.id.toString(),
                              style: TextStyle(
                                fontSize: widget.fontSizeRow,
                                color: Colors.black,
                              ),
                            )),
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            width: widget.topicWidth,
                            child: Center(
                              child: TextButton(
                                child: Text(
                                  post.topic,
                                  style: TextStyle(
                                    fontSize: widget.fontSizeRow,
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => POST(
                                              post: post,
                                              homeRoute: '/',
                                            )),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            width: widget.authorWidth,
                            child: Center(
                              child: Text(
                                post.author,
                                style: TextStyle(
                                  fontSize: widget.fontSizeRow,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(
                              post.date,
                              style: TextStyle(
                                fontSize: widget.fontSizeRow,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(
                              post.nrLikes.toString(),
                              style: TextStyle(
                                fontSize: widget.fontSizeRow,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(
                              post.nrComments.toString(),
                              style: TextStyle(
                                fontSize: widget.fontSizeRow,
                                color: Colors.black,
                              ),
                            ),
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
