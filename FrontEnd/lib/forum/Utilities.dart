import 'dart:html';

import 'package:flutter/material.dart';
import './Post.dart';

// ------------------------------------------------------------------------ BACK BUTTON

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

// ------------------------------------------------------------------------ SORT WIDGET

class CustomSort extends StatefulWidget {
  const CustomSort({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  State<CustomSort> createState() => _CustomSortState();
}

class _CustomSortState extends State<CustomSort> {
  bool checkedRecent = false;
  bool checkedPopular = false;
  bool checkedCommented = false;

  void _oncheckedRecent(bool newValue) => setState(() {
        checkedRecent = newValue;

        if (checkedRecent) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color.fromARGB(255, 153, 230, 255),
      ),
      height: widget.height,
      width: widget.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          FilterTitle(),
          Column(
            children: [
              CheckedRecent(),
              CheckedPopular(),
              CheckedCommented(),
            ],
          ),
        ],
      ),
    );
  }

  CheckboxListTile CheckedRecent() {
    return CheckboxListTile(
      title: Text(
        'Recent',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13.0,
        ),
      ),
      value: this.checkedRecent,
      onChanged: (value) {
        setState(() {
          this.checkedRecent = value!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading, //  <-- leading
    );
  }

  CheckboxListTile CheckedCommented() {
    return CheckboxListTile(
      title: Text(
        'Commented',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13.0,
        ),
      ),
      value: this.checkedCommented,
      onChanged: (value) {
        setState(() {
          this.checkedCommented = value!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading, //  <-- leading
    );
  }

  CheckboxListTile CheckedPopular() {
    return CheckboxListTile(
      title: Text(
        'Popular',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13.0,
        ),
      ),
      value: this.checkedPopular,
      onChanged: (value) {
        setState(() {
          this.checkedPopular = value!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading, //  <-- leading
    );
  }

  Row FilterTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.filter_alt_outlined),
        Text(
          'Sort By Most:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// ------------------------------------------------------------------------ PAGE TITLE

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Center(
        child: GradientText(
          text,
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontFamily: 'Barlow Condensed',
          ),
          gradient: LinearGradient(colors: [
            Colors.blue.shade400,
            Colors.blue.shade900,
          ]),
        ),
      ),
    );
  }
}
// ------------------------------------------------------------------------ TEXT WITH GRADIENT COLOR

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

// ------------------------------------------------------------------------ SEARCH BAR

class SearchBar extends StatefulWidget {
  SearchBar();

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
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
                  prefixIcon: Icon(Icons.search, size: 30.0),
                  //suffixIcon: IconButton(
                  //icon: Icon(Icons.close),
                  //onPressed: ( ) {},
                  //),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------------------ POST TABLE

class PostsTabel extends StatefulWidget {
  const PostsTabel({
    Key? key,
    required this.spaceBetweenColumns,
    required this.fontSize,
    required this.topicWidth,
    required this.authorWidth,
  }) : super(key: key);

  final double spaceBetweenColumns;
  final double fontSize;
  final double topicWidth;
  final double authorWidth;

  @override
  State<PostsTabel> createState() => _PostsTabelState();
}

class _PostsTabelState extends State<PostsTabel> {
  late List<Post> posts;
  @override
  void initState() {
    posts = Post.getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                            fontSize: widget.fontSize,
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
                            fontSize: widget.fontSize,
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
                            fontSize: widget.fontSize,
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
                            fontSize: widget.fontSize,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                DataColumn(
                  label: Text('LIKES',
                      style: TextStyle(
                        fontSize: widget.fontSize,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                DataColumn(
                  label: Text('COMMENTS',
                      style: TextStyle(
                        fontSize: widget.fontSize,
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
                            child: Center(child: Text(post.id.toString())),
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
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const POST()),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            width: widget.authorWidth,
                            child: Center(child: Text(post.author)),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(post.date),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(post.likes.toString()),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(post.likes.toString()),
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
