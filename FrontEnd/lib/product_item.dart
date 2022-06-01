// import 'dart:ffi';

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/marketplace.dart';
import 'package:homepage/product_item_expanded.dart';

class ProductItem extends StatefulWidget {
  // final String id;
  final String title;
  final double pret;
  final String linkImg;
  final String description;
  final int id;
  bool? favorited;

  void Function()? c;

  ProductItem(this.title, this.pret, this.linkImg, this.description, this.id) {
    c = () {
      Marketplace.state.ToggleFavorite(id);
    };
    favorited = false;
  }

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  void initState() {
    widget.favorited = Marketplace.state.IsItFavorite(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width * 30 / 100 * 15 / 100;
    return Container(
        padding: const EdgeInsets.all(8),
        child: TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ProductItemExpanded(widget.title, widget.pret,
                      widget.linkImg, widget.description, widget.id);
                });
          },
          style:
              TextButton.styleFrom(textStyle: TextStyle(color: Colors.black)),
          // onPressed: () => ProductItemExpanded(this.id, this.title, this.pret, this.linkImg),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: x,
                  height: x,
                  child: Image.network(widget.linkImg),
                ),
              ),
              Expanded(
                child: Text(
                  widget.title,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                  child: Center(
                child: Text((() {
                  if (widget.pret != 0) {
                    return "\$" + widget.pret.toString();
                  }

                  return "Unavailable";
                })(),
                    style: const TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.red,
                    )),
              )),
              Expanded(
                  child: Center(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.favorited = !widget.favorited!;
                      widget.c!();
                    });
                  },
                  icon: Icon(Icons.favorite),
                  color: widget.favorited! ? Colors.red : Colors.grey,
                ),
              )),
              Expanded(
                  child: Center(
                child: IconButton(
                  onPressed: () {
                    // do something;
                  },
                  icon: Icon(Icons.add),
                ),
              ))
            ],
          ),
        ));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
