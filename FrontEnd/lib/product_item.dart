// import 'dart:ffi';

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/marketplace.dart';
import 'package:homepage/product_item_expanded.dart';

class ProductItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width * 30 / 100 * 15 / 100;
    return Container(
        padding: const EdgeInsets.all(8),
        child: TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ProductItemExpanded(
                      this.title, this.pret, this.linkImg, this.description);
                });
          },
          style:
              TextButton.styleFrom(textStyle: TextStyle(color: Colors.black)),
          // onPressed: () => ProductItemExpanded(this.id, this.title, this.pret, this.linkImg),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  width: x,
                  height: x,
                  child: Image.network(linkImg),
                ),
              ),
              Flexible(
                child: Text(
                  title,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Flexible(
                child: Center(child: Text((() {
                  if (pret != 0) {
                    return "\$$pret";
                  }

                  return "ERR";
                })())),
              ),
              Flexible(
                  child: Center(
                child: IconButton(
                  onPressed: () {
                    favorited = !favorited!;
                    c!();
                  },
                  icon: Icon(Icons.favorite),
                  color: favorited! ? Colors.red : Colors.grey,
                ),
              ))
            ],
          ),
        ));
  }
}
