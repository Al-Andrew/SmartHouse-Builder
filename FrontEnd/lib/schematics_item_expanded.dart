import 'dart:html';
import 'package:flutter/material.dart';

class SchematicItemExpanded extends StatelessWidget {
  final String id;
  final String title;
  final String linkImg;

  SchematicItemExpanded(this.id, this.title, this.linkImg);

  @override
  Widget build(BuildContext context) {
    // double x = MediaQuery.of(context).size.width * 30 / 100 * 15 / 100;
    double y = MediaQuery.of(context).size.height * 80 / 100;
    double z = MediaQuery.of(context).size.height * 15 / 100;
    return AlertDialog(
        insetPadding: EdgeInsets.fromLTRB(z, z, z, z),
        contentPadding: EdgeInsets.all(10),
        actionsAlignment: MainAxisAlignment.center,
        // actionsPadding: EdgeInsetsGeometry.infinity,
        actions: [
          Expanded(
              child: FloatingActionButton(
                  onPressed: null, child: Icon(Icons.add))),
          Expanded(
              child: FloatingActionButton(
                  onPressed: Navigator.of(context).pop,
                  child: Icon(Icons.close))),
        ],
        content: Center(
            child: Container(
                width: y,
                // height: y,
                child: Expanded(
                    child: ListView(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          title + '\n',
                          softWrap: true,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
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
                    ),
                    const Expanded(child: Center(child: Text('\ndescriere\n'))),
                  ],
                )))));
    // TextButton(
    //   onPressed: null,
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Expanded(
    //         child: Container(
    //           width: x,
    //           height: x,
    //           child: Image.network(linkImg),
    //         ),
    //       ),
    //       Expanded(
    //         child: Text(
    //           title,
    //           softWrap: true,
    //           maxLines: 2,
    //           overflow: TextOverflow.ellipsis,
    //         ),
    //       ),
    //       Expanded(
    //         child: Center(child: Text((() {
    //           if (pret != 0) {
    //             return "\$$pret";
    //           }

    //           return "ERR";
    //         })())),
    //       ),
    //       const Expanded(
    //           child: Center(
    //         child: IconButton(
    //           onPressed: null,
    //           icon: Icon(Icons.favorite),
    //           color: Colors.red,
    //         ),
    //       ))
    //     ],
    //   ),
    // ));
  }
}
