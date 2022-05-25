import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/forum/utilities/Utilities.dart';
import 'package:homepage/forum/classes/PostClass.dart';
import 'package:homepage/forum/classes/CommentClass.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ForumGlobals.dart' as globals;
import 'MyPosts.dart';

//import 'package:intl/intl.dart';

class POST extends StatefulWidget {
  const POST({
    Key? key,
    required this.post,
    required this.homeRoute,
  }) : super(key: key);
  final Post post;
  final String homeRoute;

  @override
  State<POST> createState() => _POSTState();
}

class _POSTState extends State<POST> {
  Color _likeIconColor = Colors.black;
  bool _isLiked = false;
  late TextEditingController commentController;
  late TextEditingController titleReportController;

  late TextEditingController motivationReportController;

  @override
  void initState() {
    commentController = TextEditingController();
    titleReportController = TextEditingController();
    motivationReportController = TextEditingController();
  }

  @override
  void dispose() {
    commentController.dispose();
    titleReportController.dispose();
    motivationReportController.dispose();
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
            double tagWidth;

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
                            route: widget.homeRoute,
                          ),
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
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                bottom: 20 / 2,
                              ),
                              child: ConstrainedBox(
                                constraints: new BoxConstraints(
                                  minWidth: 400,
                                ),
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Color(0xFFAAECF5),
                                    ),
                                    padding: EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                      top: 20,
                                      bottom: 10,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            widget.post.content,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                          alignment: Alignment.topLeft,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                              top: 40 - 20,
                                              bottom: 10,
                                            ),
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      width: widget.post.tags
                                                              .length *
                                                          60,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 220,
                                                      ),
                                                      height: 25,
                                                      child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: widget
                                                            .post.tags.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return TagBox(
                                                            60,
                                                            25,
                                                            widget.post
                                                                .tags[index],
                                                            12,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                    right: 10,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .only(
                                                                top: 15.0,
                                                              ),
                                                              child: Text(
                                                                widget.post
                                                                    .nrLikes
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                              )),
                                                          ButtonLike(25, 25),
                                                        ],
                                                      ),
                                                      ButtonShare(25, 25),
                                                      Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 4.0),
                                                          child: ButtonReport(
                                                              25, 25)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ))
                                      ],
                                    )),
                              ),
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
                                                        bottom: 10,
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
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        bottom: 10,
                                                        right: 20,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          ButtonDeleteComment(
                                                            30,
                                                            30,
                                                            widget.post
                                                                    .comments[
                                                                index],
                                                          ),
                                                        ],
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
                            context: context,
                            width: 40,
                            height: 40,
                            route: widget.homeRoute,
                          ),
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
                  PostBox(100, 40, 40, 14, 13, 230, 62),
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
                            route: widget.homeRoute,
                          ),
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
                  PostBox(150, 50, 50, 15, 14, 350, 70),
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

  Padding PostBox(
      double outPadding,
      double inPadding,
      double TextPadding,
      double MainFontSize,
      double SecondayFontSize,
      double tagsBoxWidth,
      double tagBoxWidth) {
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
            ContentBox(inPadding, TextPadding, SecondayFontSize, tagsBoxWidth,
                tagBoxWidth),
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

  Padding ContentBox(double interiorPadding, double textPadding,
      double FontSize, double tagsBoxWidth, double tagBoxWidth) {
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          width: widget.post.tags.length * tagBoxWidth,
                          constraints: BoxConstraints(maxWidth: tagsBoxWidth),
                          height: 35,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.post.tags.length,
                            itemBuilder: (context, index) {
                              return TagBox(
                                tagBoxWidth,
                                35,
                                widget.post.tags[index],
                                FontSize - 1,
                              );
                            },
                          ),
                        ),
                        Row(
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
                            Container(
                                margin: const EdgeInsets.only(bottom: 4.0),
                                child: ButtonReport(30, 30)),
                          ],
                        ),
                      ],
                    ))
              ],
            )),
      ),
    );
  }

  Container TagBox(double width, double height, String tag, double fontSize) {
    return Container(
      padding: EdgeInsets.only(
        right: 2,
        left: 2,
      ),
      width: width,
      height: height,
      child: Container(
        child: Center(
            child: Text(
          tag,
          style: TextStyle(
            fontSize: fontSize,
          ),
        )),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xFFD9F7FF),
        ),
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
                  return CommentBox(
                    inPadding,
                    textPadding,
                    FontSize,
                    widget.post.comments[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //-------------------------------------------------------------------------------------- COMMENT BOX --------------------------------------------------------------------------------------------

  Container CommentBox(
      double inPadding, double textPadding, double FontSize, Comment comment) {
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
          child: Column(
            children: [
              AuthorAndDate(
                textPadding,
                comment.author,
                comment.date,
                FontSize + 1,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: textPadding,
                  right: textPadding,
                  bottom: 20,
                ),
                child: Text(
                  comment.content,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSize,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 10,
                  right: textPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonDeleteComment(30, 30, comment),
                  ],
                ),
              )
            ],
          ),
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
          onPressed: () {
            share();
          },
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

  Future share() async {
    final topic = widget.post.topic;
    final content = widget.post.content;
    final postUrl = window.location.href; //to get the link of current tab, maybe we will implement this in the future
    //We could share the link of the post instead of contet, but our link is the same for all pages :\
    final url = 'https://twitter.com/intent/tweet?text=$topic%0D%0A$content';
    Uri finalUri = Uri.parse(url);
    if(await canLaunchUrl(finalUri)){
      await launchUrl(finalUri);
    }
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
          final comment = await OpenDialogComment();
          if (comment == null || comment.isEmpty) {
            commentController.clear();

            return;
          }
          // var now = new DateTime.now();
          // var formatter = DateFormat('dd/MM/yyyy');
          // String formattedDate = formatter.format(now);
          setState(() => widget.post
              .addComment(1, 1, widget.post.id, comment, "author", "date", 0));
          globals.isChanged = true;
          commentController.clear();
        },
      ),
    );
  }

  Future<String?> OpenDialogComment() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: Text('Type your comment'),
          content: Container(
            constraints: BoxConstraints(
              maxWidth: 300.0,
              maxHeight: 400.0,
            ),
            child: TextField(
              autofocus: true,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 20,
              decoration: InputDecoration(
                hintText: 'Enter your comment here',
              ),
              controller: commentController,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(commentController.text);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      );

//-------------------------------------------------------------------------------------- REPORT BUTTON --------------------------------------------------------------------------------------------

  Container ButtonReport(double width, double height) {
    return Container(
      height: height,
      width: width,
      child: Ink(
        child: IconButton(
          onPressed: () async {
            final title = await OpenDialogReport1();
            if (title == null || title.isEmpty) {
              titleReportController.clear();
              return;
            } else {
              final motivation = await OpenDialogReport2();

              if (motivation == null || motivation.isEmpty) {
                titleReportController.clear();
                motivationReportController.clear();
                return;
              }

              setState(() =>
                  widget.post.addReport(1, 1, 1, title, motivation, "date"));
              titleReportController.clear();
              motivationReportController.clear();
            }

            // var now = new DateTime.now();
            // var formatter = DateFormat('dd/MM/yyyy');
            // String formattedDate = formatter.format(now);
          },
          icon: Icon(Icons.report, color: Colors.black),
          iconSize: 28,
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

  Future<String?> OpenDialogReport1() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: Text('Type your report'),
          content: Container(
            constraints: BoxConstraints(
              maxHeight: 400.0,
              maxWidth: 300.0,
            ),
            child: TextField(
              autofocus: true,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter the title here',
              ),
              controller: titleReportController,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(titleReportController.text);
              },
              child: Text('Next'),
            ),
          ],
        ),
      );
  Future<String?> OpenDialogReport2() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: Text('Type your report'),
          content: Container(
            constraints: BoxConstraints(
              maxHeight: 400.0,
              maxWidth: 300.0,
            ),
            child: TextField(
              autofocus: true,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter the motivation here',
              ),
              controller: motivationReportController,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(motivationReportController.text);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      );

//-------------------------------------------------------------------------------------- DELETE COMMENT BUTTON --------------------------------------------------------------------------------------------
  Container ButtonDeleteComment(double height, double width, Comment comment) {
    return Container(
      height: height,
      width: width,
      child: Ink(
        child: IconButton(
          onPressed: () {
            setState(
              () async {
                final isConfirmed = await _isDeletingDesired();
                if (isConfirmed == true) {
                  globals.isChanged = true;
                  setState(() {
                    widget.post.removeComment(comment);
                  });
                } else {}
              },
            );
          },
          icon: Icon(Icons.delete, color: Colors.black),
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
                    'If you click yes, your comment will be deleted permanently.'),
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
}
