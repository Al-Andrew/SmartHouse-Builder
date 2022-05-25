import 'dart:html';

import 'package:flutter/material.dart';
import './buttons/SortButton.dart';

class CustomSort extends StatefulWidget {
  CustomSort({
    Key? key,
    required this.height,
    required this.width,
    required this.route,
  }) : super(key: key);

  final double height;
  final double width;
  String route;

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
              SortButton(
                width: 100,
                height: 35,
                checkedCommented: checkedCommented,
                checkedPopular: checkedPopular,
                checkedRecent: checkedRecent,
                route: widget.route,
              ),
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
