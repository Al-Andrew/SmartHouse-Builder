import 'package:flutter/material.dart';
import 'package:homepage/builder.dart';

class SchematicItem extends StatelessWidget {
  final String id;
  final String title;
  final String linkImg;
  var add;

  SchematicItem(this.id, this.title, this.linkImg, this.add);

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width * 30 / 100 * 60 / 100;
    return Container(
        padding: const EdgeInsets.all(8),
        child: TextButton(
          onPressed: add,
          onHover: null,
          style:
              TextButton.styleFrom(textStyle: TextStyle(color: Colors.black)),
          // onPressed: () => ProductItemExpanded(this.id, this.title, this.pret, this.linkImg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  title,
                  softWrap: true,
                  style: TextStyle(color: Colors.black),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Flexible(
                child: Container(
                  width: 50,
                  height: 50,
                  child: Image.network(linkImg),
                ),
              ),
            ],
          ),
        ));
  }
}
