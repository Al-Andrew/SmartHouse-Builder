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
        title: const Text("Marketplace"),
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
