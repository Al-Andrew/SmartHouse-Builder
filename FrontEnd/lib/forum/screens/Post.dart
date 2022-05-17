import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/forum/utilities/Utilities.dart';
import 'package:homepage/forum/classes/PostClass.dart';
import 'package:intl/intl.dart';

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
                      left: 20,
                      right: 20,
                      bottom: 20,
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
                                left: 20,
                                right: 20,
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
                                          Text(
                                            widget.post.author,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      )),
                                  Expanded(
                                      flex: 0,
                                      child: Row(
                                        children: [
                                          Icon(Icons.calendar_today),
                                          Text(
                                            widget.post.date,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            ContentBox(
                              20,
                              20,
                              13,
                            ), //POST TEXT + COMMENTS AND LIKEBUTTON SHAREBUTTON REPORTBUTTON
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                bottom: 20,
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
                                              top: 20 / 2,
                                              left: 20,
                                              right: 20,
                                              bottom: 20 / 2),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                flex: 0,
                                                child: Text(
                                                  "Comments:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 0,
                                                child: SizedBox(height: 5),
                                              ),
                                              Expanded(
                                                flex: 0,
                                                child:
                                                    ButtonPostComment(150, 30),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount:
                                              widget.post.comments.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 20 / 2,
                                              ),
                                              child: ConstrainedBox(
                                                constraints: new BoxConstraints(
                                                  minWidth: 700,
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(20),
                                                    ),
                                                    color: Color(0xFFD9F7FF),
                                                  ),
                                                  child: Column(children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        left: 20,
                                                        right: 20,
                                                        bottom: 20 / 2,
                                                        top: 0.3 * 20,
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Expanded(
                                                              flex: 0,
                                                              child: Row(
                                                                children: [
                                                                  Icon(Icons
                                                                      .person),
                                                                  Text(
                                                                    widget
                                                                        .post
                                                                        .comments[
                                                                            index]
                                                                        .author,
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                                  ),
                                                                ],
                                                              )),
                                                          Expanded(
                                                              flex: 0,
                                                              child: Row(
                                                                children: [
                                                                  Icon(Icons
                                                                      .calendar_today),
                                                                  Text(
                                                                    widget
                                                                        .post
                                                                        .comments[
                                                                            index]
                                                                        .date,
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                                  ),
                                                                ],
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                        left: 20,
                                                        right: 20,
                                                        bottom: 20,
                                                      ),
                                                      child: Text(
                                                        widget
                                                            .post
                                                            .comments[index]
                                                            .content,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13.0,
                                                        ),
                                                      ),
                                                    )
                                                  ]),
                                                ),
                                              ),
                                            );
                                          },
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
                  PostBox(100, 40, 40, 14, 13),
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
                  PostBox(150, 50, 50, 15, 14),
                ],
              ),
            );
          }
        }),
      ),
    );
  }

//------------------------------------------------------- METHODS --------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------- POST BOX --------------------------------------------------------------------------------------------

  Padding PostBox(double outPadding, double inPadding, double TextPadding,
      double MainFontSize, double SecondayFontSize) {
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
            AuthorAndDate(
                inPadding, widget.post.author, widget.post.date, MainFontSize),
            ContentBox(inPadding, TextPadding, SecondayFontSize),
            CommentsBox(inPadding, TextPadding,
                SecondayFontSize), //POST TEXT + COMMENTS AND LIKEBUTTON SHAREBUTTON REPORTBUTTON
          ],
        ),
      ),
    );
  }

  Padding AuthorAndDate(
      double inPadding, String author, String date, double MainFontSize) {
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
                  Text(
                    author,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MainFontSize,
                    ),
                  ),
                ],
              )),
          Expanded(
              flex: 0,
              child: Row(
                children: [
                  Icon(Icons.calendar_today),
                  Text(
                    date,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MainFontSize,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Padding ContentBox(
      double interiorPadding, double textPadding, double FontSize) {
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: FontSize + 1,
                    ),
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

  //-------------------------------------------------------------------------------------- COMMENTS BOX --------------------------------------------------------------------------------------------

  Padding CommentsBox(double inPadding, double textPadding, double FontSize) {
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
                    Expanded(
                        flex: 1,
                        child: Text(
                          "Comments:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        )),
                    Expanded(
                      flex: 0,
                      child: ButtonPostComment(150, 30),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: widget.post.comments.length,
                itemBuilder: (context, index) {
                  if (widget.post.comments.isNotEmpty) {
                    return CommentBox(
                      inPadding,
                      textPadding,
                      widget.post.comments[index].author,
                      widget.post.comments[index].content,
                      widget.post.comments[index].date,
                      FontSize,
                    );
                  } else {
                    return Text(
                      "No comments...",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //-------------------------------------------------------------------------------------- COMMENT BOX --------------------------------------------------------------------------------------------

  Container CommentBox(double inPadding, double textPadding, String author,
      String content, String date, double FontSize) {
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
              FontSize + 1,
            ),
            Container(
              padding: EdgeInsets.only(
                left: textPadding,
                right: textPadding,
                bottom: textPadding,
              ),
              child: Text(
                content,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  //-------------------------------------------------------------------------------------- BUTTON LIKE --------------------------------------------------------------------------------------------

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

  //-------------------------------------------------------------------------------------- BUTTON SHARE --------------------------------------------------------------------------------------------

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

  //-------------------------------------------------------------------------------------- BUTTON POST COMMENT --------------------------------------------------------------------------------------------

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
          var now = new DateTime.now();
          var formatter = DateFormat('dd/MM/yyyy');
          String formattedDate = formatter.format(now);
          setState(() => widget.post.addComment(
              1, 1, widget.post.id, comment, "author", formattedDate, 0));
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
        ),
      );
}
