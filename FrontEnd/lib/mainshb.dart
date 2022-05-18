import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homepage/about_us.dart';
import 'package:homepage/contact_us.dart';
import 'package:homepage/homepage.dart';
import 'package:homepage/marketplace.dart';
import 'package:homepage/shb.dart';

import 'forum/Forum.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';

class MyHomePageSHB extends StatefulWidget {
  MyHomePageSHB();
  // final String title;

  @override
  State<MyHomePageSHB> createState() => _MyHomePageSHBState();
}

class _MyHomePageSHBState extends State<MyHomePageSHB> {
  int _selectedIndex = 1;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SHB(),
    Marketplace(),
    Forum(),
    AboutUs(),
    ContactUs()
  ];

  void changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          title: TextButton(
            onPressed: () => changeScreen(0),
            child: const Image(
              image: AssetImage('assets/logo_smart.png'),
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          actions: [
            ButtonBar(
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(color: Colors.black)),
                    onPressed: () => changeScreen(0),
                    child: const Center(
                      child: Text('Home'),
                    )),
                TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(color: Colors.black)),
                    onPressed: () => changeScreen(3),
                    child: const Center(
                      child: Text('Forum'),
                    )),
                TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(color: Colors.black)),
                    onPressed: () => changeScreen(1),
                    child: const Center(
                      child: Text('SHB'),
                    )),
                TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(color: Colors.black)),
                    onPressed: () => changeScreen(2),
                    child: const Center(
                      child: Text('Marketplace'),
                    )),
                TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(color: Colors.black)),
                    onPressed: () => changeScreen(4),
                    child: const Center(
                      child: Text('About'),
                    )),
                TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(color: Colors.black)),
                    onPressed: () => {
                          changeScreen(5)
                        },
                    child: const Center(
                      child: Text('Contact Us'),
                    )),
                Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(color: Colors.white)),
                        onPressed: () => {
                              //do something
                            },
                        child: const Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'BebasNeuePro'),
                          ),
                        ))),
              ],
            )
          ],
        ),
        body: Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ));
  }
}
