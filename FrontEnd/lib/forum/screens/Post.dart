import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/forum/screens/Utilities.dart';
import 'package:homepage/forum/classes/PostClass.dart';

class POST extends StatefulWidget {
  const POST({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;

  @override
  State<POST> createState() => _POSTState();
}

class _POSTState extends State<POST> {
  Color _likeIconColor = Colors.black;
  bool _isLiked = false;
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
                              context: context, width: 40, height: 40),
                        ),
                        Expanded(
                          flex: 0,
                          child: SizedBox(
                            width: 20,
                          ),
                        ),
                        Expanded(
                          child: CustomTitle(
                            text: widget.post.topic,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    //AUTHOR + DATE
                    padding: EdgeInsets.only(
                      left: 35,
                      right: 35,
                      bottom: 35,
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xFFD9F7FF),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 35,
                                right: 35,
                                bottom: 15,
                                top: 20,
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 0,
                                      child: Row(
                                        children: [
                                          Icon(Icons.person),
                                          Text(widget.post.author),
                                        ],
                                      )),
                                  Expanded(
                                      flex: 0,
                                      child: Row(
                                        children: [
                                          Icon(Icons.calendar_today),
                                          Text(widget.post.date),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            ContentBox(35,
                                35), //POST TEXT + COMMENTS AND LIKEBUTTON SHAREBUTTON REPORTBUTTON
                            Padding(
                              padding: EdgeInsets.only(
                                left: 35,
                                right: 35,
                                bottom: 35,
                              ),
                              child: ConstrainedBox(
                                constraints: new BoxConstraints(
                                  minWidth: 1000,
                                ),
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Color(0xFFAAECF5),
                                    ),
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 35 / 2,
                                              left: 35,
                                              right: 35,
                                              bottom: 35 / 2),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                  flex: 0,
                                                  child: Text("Comments:")),
                                              Expanded(
                                                flex: 0,
                                                child:
                                                    ButtonPostComment(150, 30),
                                              ),
                                            ],
                                          ),
                                        ),
                                        CommentBox(
                                          35,
                                          35,
                                          widget.post.comments[0].author,
                                          widget.post.comments[0].content,
                                          widget.post.comments[0].date,
                                        ),
                                        CommentBox(
                                          35,
                                          35,
                                          widget.post.comments[1].author,
                                          widget.post.comments[1].content,
                                          widget.post.comments[1].date,
                                        ),
                                        CommentBox(
                                          35,
                                          35,
                                          widget.post.comments[2].author,
                                          widget.post.comments[2].content,
                                          widget.post.comments[2].date,
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        )),
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
                              context: context, width: 40, height: 40),
                        ),
                        Expanded(
                          child: CustomTitle(
                            text: widget.post.topic,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PostBox(100, 40, 40),
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
                              context: context, width: 40, height: 40),
                        ),
                        Expanded(
                          child: CustomTitle(
                            text: widget.post.topic,
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PostBox(150, 50, 50),
                ],
              ),
            );
          }
        }),
      ),
    );
  }

//------------------------------------------------------- METHODS --------------------------------------------------------------------------------------------

  Padding PostBox(double outPadding, double inPadding, double TextPadding) {
    return Padding(
      //AUTHOR + DATE
      padding: EdgeInsets.only(
        left: outPadding,
        right: outPadding,
        bottom: inPadding,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color(0xFFD9F7FF),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            AuthorAndDate(inPadding, widget.post.author, widget.post.date),
            ContentBox(inPadding, TextPadding),
            CommentsBox(inPadding,
                TextPadding), //POST TEXT + COMMENTS AND LIKEBUTTON SHAREBUTTON REPORTBUTTON
          ],
        ),
      ),
    );
  }

  Padding AuthorAndDate(double inPadding, String author, String date) {
    return Padding(
      padding: EdgeInsets.only(
        left: inPadding,
        right: inPadding,
        bottom: inPadding / 2,
        top: 0.3 * inPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Icon(Icons.person),
                  Text(author),
                ],
              )),
          Expanded(
              flex: 0,
              child: Row(
                children: [
                  Icon(Icons.calendar_today),
                  Text(date),
                ],
              )),
        ],
      ),
    );
  }

  Padding ContentBox(double interiorPadding, double textPadding) {
    return Padding(
      padding: EdgeInsets.only(
        left: interiorPadding,
        right: interiorPadding,
        bottom: interiorPadding / 2,
      ),
      child: ConstrainedBox(
        constraints: new BoxConstraints(
          minWidth: 1000,
        ),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color(0xFFAAECF5),
            ),
            padding: EdgeInsets.only(
              left: textPadding,
              right: textPadding,
              top: textPadding,
              bottom: 10,
            ),
            child: Column(
              children: [
                Container(
                  child: Text(
                    widget.post.content,
                  ),
                  alignment: Alignment.topLeft,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: textPadding - 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                widget.post.nrLikes.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.0,
                                ),
                              )),
                          ButtonLike(30, 30),
                        ],
                      ),
                      ButtonShare(30, 30),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  Padding CommentsBox(double inPadding, double textPadding) {
    return Padding(
      padding: EdgeInsets.only(
        left: inPadding,
        right: inPadding,
        bottom: inPadding,
      ),
      child: ConstrainedBox(
        constraints: new BoxConstraints(
          minWidth: 1000,
        ),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color(0xFFAAECF5),
            ),
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: textPadding / 2,
                      left: textPadding,
                      right: textPadding,
                      bottom: textPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(flex: 1, child: Text("Comments:")),
                      Expanded(
                        flex: 0,
                        child: ButtonPostComment(150, 30),
                      ),
                    ],
                  ),
                ),
                CommentBox(
                  inPadding,
                  textPadding,
                  widget.post.comments[0].author,
                  widget.post.comments[0].content,
                  widget.post.comments[0].date,
                ),
                CommentBox(
                  inPadding,
                  textPadding,
                  widget.post.comments[1].author,
                  widget.post.comments[1].content,
                  widget.post.comments[1].date,
                ),
                CommentBox(
                  inPadding,
                  textPadding,
                  widget.post.comments[2].author,
                  widget.post.comments[2].content,
                  widget.post.comments[2].date,
                ),
              ],
            )),
      ),
    );
  }

  Container CommentBox(double inPadding, double textPadding, String author,
      String content, String date) {
    return Container(
      padding: EdgeInsets.only(
        left: inPadding,
        right: inPadding,
        bottom: inPadding / 2,
      ),
      child: ConstrainedBox(
        constraints: new BoxConstraints(
          minWidth: 700,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: Color(0xFFD9F7FF),
          ),
          child: Column(children: [
            AuthorAndDate(
              textPadding,
              author,
              date,
            ),
            Container(
              padding: EdgeInsets.only(
                left: textPadding,
                right: textPadding,
                bottom: textPadding,
              ),
              child: Text(content),
            )
          ]),
        ),
      ),
    );
  }

  Container ButtonLike(double height, double width) {
    return Container(
      height: height,
      width: width,
      child: Ink(
        child: IconButton(
          onPressed: () {
            setState(() {
              if (!_isLiked) {
                _likeIconColor = Colors.red;
                _isLiked = true;
                widget.post.setNrLikes(widget.post.nrLikes + 1);
              } else {
                _likeIconColor = Colors.black;
                _isLiked = false;
                widget.post.setNrLikes(widget.post.nrLikes - 1);
              }
            });
          },
          icon: Icon(Icons.favorite, color: _likeIconColor),
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.transparent,
        ),
      ),
    );
  }

  Container ButtonShare(double height, double width) {
    return Container(
      height: height,
      width: width,
      child: Ink(
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.share, color: Colors.black),
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.transparent,
        ),
      ),
    );
  }

  Container ButtonPostComment(double width, double height) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.transparent,
      ),
      child: ElevatedButton(
        child: Text('Add a comment'),
        onPressed: () async {
          final comment = await OpenDialog();
          if (comment == null || comment.isEmpty) {
            return;
          }
          setState(() => widget.post
              .addComment(1, widget.post.id, comment, "author", "date", 0));
          controller.clear();
        },
      ),
    );
  }

  Future<String?> OpenDialog() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            title: Text('Type your comment'),
            content: TextField(
              autofocus: true,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 20,
              decoration: InputDecoration(
                hintText: 'Enter your comment here',
              ),
              controller: controller,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(controller.text);
                },
                child: Text('Submit'),
              ),
            ],
          ));
}
