import 'package:flutter/material.dart';

class BuilderCon extends StatelessWidget {
  BuilderCon();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Container(
        color: Colors.deepPurple,
        child: Center(child: Text("Builderul")),
      ),
    );
  }
}
