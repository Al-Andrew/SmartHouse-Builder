import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homepage/about_us.dart';
import 'package:homepage/homepage.dart';
import 'package:homepage/marketplace.dart';
import 'package:homepage/forum/ForumHomePage.dart';
import 'package:homepage/shb.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart House Builder',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'Smart House Builder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SHB(),
    Marketplace(),
    Forum(),
    AboutUs(),
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
            onPressed: () {},
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
                          //do something
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
