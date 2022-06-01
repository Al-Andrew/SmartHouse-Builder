import 'dart:html';
import 'builder.dart';
import 'package:flutter/material.dart';

class SchematicItemExpanded extends StatelessWidget {
  final String id;
  final String title;
  final String linkImg;
  var add;

  SchematicItemExpanded(this.id, this.title, this.linkImg, this.add);

  @override
  Widget build(BuildContext context) {
    // double x = MediaQuery.of(context).size.width * 30 / 100 * 15 / 100;
    double y = MediaQuery.of(context).size.height * 80 / 100;
    double z = MediaQuery.of(context).size.height * 15 / 100;
    return AlertDialog(
        // insetPadding: EdgeInsets.fromLTRB(z, z, z, z),
        // contentPadding: EdgeInsets.all(10),
        actionsAlignment: MainAxisAlignment.center,
        // actionsPadding: EdgeInsetsGeometry.infinity,
        actions: [
          FloatingActionButton(onPressed: add, child: Icon(Icons.add)),
          FloatingActionButton(
              onPressed: Navigator.of(context).pop, child: Icon(Icons.close)),
        ],
        content: Center(
            child: Container(
                width: y,
                height: y,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Center(
                      child: Text(
                        title + '\n',
                        softWrap: true,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width *
                          50 /
                          100 *
                          80 /
                          100,
                      height: MediaQuery.of(context).size.height *
                          50 /
                          100 *
                          80 /
                          100,
                      child: Image.network(linkImg),
                    ),
                    const Center(child: Text('\ndescriere\n')),
                  ],
                ))));
  }
}
