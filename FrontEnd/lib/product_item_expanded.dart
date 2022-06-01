// import 'dart:ffi';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:homepage/marketplace.dart';

class ProductItemExpanded extends StatefulWidget {
  final int id;
  final String title;
  final double pret;
  final String linkImg;
  final String description;
  bool? favorited;

  void Function()? c;
  ProductItemExpanded(
      this.title, this.pret, this.linkImg, this.description, this.id) {
    c = () {
      Marketplace.state.ToggleFavorite(id);
    };
    favorited = false;
  }
  @override
  State<ProductItemExpanded> createState() => _ProductItemExpandedState();
}

class _ProductItemExpandedState extends State<ProductItemExpanded> {
  @override
  void initState() {
    widget.favorited = Marketplace.state.IsItFavorite(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double x = MediaQuery.of(context).size.width * 30 / 100 * 15 / 100;
    double y = MediaQuery.of(context).size.height * 80 / 100;
    double z = MediaQuery.of(context).size.height * 15 / 100;
    return AlertDialog(
      //insetPadding: EdgeInsets.fromLTRB(z, z, z, z),
      //contentPadding: EdgeInsets.all(10),
      actionsAlignment: MainAxisAlignment.center,
      // actionsPadding: EdgeInsetsGeometry.infinity,
      //actionsOverflowButtonSpacing: 1,
      actions: [
        FloatingActionButton(onPressed: null, child: Icon(Icons.add)),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              widget.favorited = !widget.favorited!;
              widget.c!();
            });
          },
          child: Icon(
            Icons.favorite,
          ),
          foregroundColor: widget.favorited! ? Colors.red : Colors.black,
        ),
        FloatingActionButton(
            onPressed: Navigator.of(context).pop, child: Icon(Icons.close)),
      ],
      content: Center(
          child: Container(
              width: y,
              height: y,
              child: ListView(
                // mainAxisSize: MainAxisSize.max,
                shrinkWrap: true,
                children: [
                  Text(
                    widget.title + '\n',
                    softWrap: true,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text((() {
                    if (widget.pret != 0) {
                      return "\n\$" + widget.pret.toString() + "\n";
                    }

                    return "Unavailable product.\n";
                  })(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      )),
                  Container(
                    width:
                        MediaQuery.of(context).size.width * 50 / 100 * 80 / 100,
                    height: MediaQuery.of(context).size.height *
                        50 /
                        100 *
                        80 /
                        100,
                    child: Image.network(widget.linkImg),
                  ),
                  SingleChildScrollView(
                      child: Text('\n' + widget.description.toString() + '\n')),
                ],
              ))),
    );
  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
