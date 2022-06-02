// import 'dart:http';
import 'dart:convert';
import 'dart:io';
// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:homepage/all_products.dart';
import 'package:homepage/builder.dart';
// import 'package:homepage/schematics.dart';
// import 'package:flutter/rendering.dart';
// import 'package:homepage/dummy_products.dart';
// import 'package:homepage/dummy_schematics.dart';
import 'package:homepage/fav_products.dart';
import 'package:homepage/models/product.dart';
import 'package:homepage/schematics.dart';
import 'package:homepage/widgets/SearchMarket.dart';

import '../global_variables.dart' as globals;
// import 'package:homepage/models/schematic.dart';
// import 'package:homepage/product_item.dart';
// import 'package:homepage/schematics_item.dart';
import 'package:http/http.dart' as http;
import 'package:homepage/dummy_schematics.dart';
import 'package:homepage/dummy_setup.dart';

import 'all_setups.dart';
import 'forum/utilities/Utilities.dart';

class Utilities extends StatefulWidget {
  const Utilities();

  @override
  State<Utilities> createState() => _UtilitiesState();
}

class _UtilitiesState extends State<Utilities> {
  int _selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    AllSchematics(DUMMY_SCHEMATICS),
    AllSetups(DUMMY_SETUPS)
  ];

  void changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: Column(children: [
        Container(
            child: Column(children: [
          SearchMarket(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () => changeScreen(0),
                  child: Text(
                    'Components',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(1))),
              TextButton(
                  onPressed: () => changeScreen(1),
                  child: Text(
                    'Setups',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(1))),
            ],
          ),
        ])),
        Expanded(child: widgetOptions.elementAt(_selectedIndex))
      ]),
    ));
  }
}
