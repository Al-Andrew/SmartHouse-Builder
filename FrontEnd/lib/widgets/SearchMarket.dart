import 'dart:html';

import 'package:flutter/material.dart';

class SearchMarket extends StatefulWidget {
  const SearchMarket({
    Key? key,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  final String text;
  final ValueChanged<String> onChanged;

  @override
  State<SearchMarket> createState() => _SearchMarketState();
}

class _SearchMarketState extends State<SearchMarket> {
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
              child: TextField(
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
                  icon: IconButton(
                    padding: EdgeInsets.only(bottom: 2.0),
                    icon: Icon(Icons.search, size: 30.0),
                    onPressed: () { 
                      // do something??
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
                onChanged: widget.onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
