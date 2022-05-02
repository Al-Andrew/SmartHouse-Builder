import 'package:flutter/material.dart';
import 'package:homepage/builder.dart';
import 'package:homepage/marketplace.dart';

class SHB extends StatefulWidget {
  SHB();

  @override
  State<SHB> createState() => _SHBState();
}

class _SHBState extends State<SHB> {
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
                child: Marketplace())
          ],
        ),
      ),
    );
  }
}
