import 'package:flutter/material.dart';
import 'package:homepage/builder.dart';
import 'package:homepage/dummy_schematics.dart';
import 'package:homepage/marketplace.dart';
import 'package:homepage/schematics.dart';

class SHB extends StatefulWidget {
  SHB();

  @override
  State<SHB> createState() => _SHBState();
}

class _SHBState extends State<SHB> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Marketplace(),
    AllSchematics(DUMMY_SCHEMATICS)
  ];

  void changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 70 / 100,
                height: MediaQuery.of(context).size.height * 90 / 100,
                child: BuilderCon()),
            Container(
                width: MediaQuery.of(context).size.width * 30 / 100,
                height: MediaQuery.of(context).size.height * 90 / 100,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () => changeScreen(0),
                          child: Text(
                            'Marketplace',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(1))),
                      Padding(
                          padding: EdgeInsets.only(
                        left: 10,
                      )),
                      TextButton(
                          onPressed: () => changeScreen(1),
                          child: Text(
                            'Schematics',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(1))),
                    ],
                  ),
                  Expanded(child: _widgetOptions.elementAt(_selectedIndex))
                ]))
          ],
        ),
      ),
    );
  }
}
