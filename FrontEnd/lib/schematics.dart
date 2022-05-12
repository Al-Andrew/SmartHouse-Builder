import 'package:flutter/material.dart';

class Schematics extends StatelessWidget {
  Schematics();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Container(
        color: Colors.green,
        child: Center(child: Text("Schematics")),
      ),
    );
  }
}
