import 'package:flutter/material.dart';
import 'package:homepage/builder.dart';
import 'package:homepage/marketplace.dart';

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
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
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
                suffixIcon: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
