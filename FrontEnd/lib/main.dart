import 'package:flutter/material.dart';
import 'package:marketplace/builder.dart';
import 'package:marketplace/marketplace.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          title: TextButton(
            onPressed: null,
            child: const Image(
              image: AssetImage('assets/logo_smart.png'),
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          actions: [
            ButtonBar(
              children: [
                Expanded(
                    child: TextButton(
                        style: TextButton.styleFrom(
                            textStyle: TextStyle(color: Colors.black)),
                        onPressed: null,
                        child: Center(
                          child: Text('Home'),
                        ))),
                Expanded(
                    child: TextButton(
                        style: TextButton.styleFrom(
                            textStyle: TextStyle(color: Colors.black)),
                        onPressed: null,
                        child: Center(
                          child: Text('Forum'),
                        ))),
                Expanded(
                    child: TextButton(
                        style: TextButton.styleFrom(
                            textStyle: TextStyle(color: Colors.black)),
                        onPressed: null,
                        child: Center(
                          child: Text('SHB'),
                        ))),
                Expanded(
                    child: TextButton(
                        style: TextButton.styleFrom(
                            textStyle: TextStyle(color: Colors.black)),
                        onPressed: null,
                        child: Center(
                          child: Text('About'),
                        ))),
                Expanded(
                    child: TextButton(
                        style: TextButton.styleFrom(
                            textStyle: TextStyle(color: Colors.black)),
                        onPressed: null,
                        child: Center(
                          child: Text('Contact Us'),
                        ))),
                Expanded(
                    child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                            style: TextButton.styleFrom(
                                textStyle: TextStyle(color: Colors.black)),
                            onPressed: null,
                            child: Center(
                              child: Text('Sign Up'),
                            )))),
              ],
            )
          ],
        ),
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
                child: Marketplace())
          ],
        ),
      ),
    );
  }
}
