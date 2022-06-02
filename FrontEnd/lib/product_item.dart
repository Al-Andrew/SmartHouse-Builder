// import 'dart:ffi';

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homepage/builder.dart';
import 'package:homepage/marketplace.dart';
import 'package:homepage/product_item_expanded.dart';

import 'all_products.dart';
import 'fav_products.dart';

class ProductItem extends StatefulWidget {
  // final String id;
  final String title;
  final double pret;
  final String linkImg;
  final String description;
  final int id;
  String productUrl;
  bool? favorited;

  void Function()? c;

  ProductItem(this.title, this.pret, this.linkImg, this.description, this.id,
      this.productUrl) {
    c = () {
      Marketplace.state.ToggleFavorite(id);
    };
    favorited = Marketplace.state.IsItFavorite(id);
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
                  return ProductItemExpanded(
                      widget.title,
                      widget.pret,
                      widget.linkImg,
                      widget.description,
                      widget.id,
                      widget.productUrl);
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
                      widget.c!();
                      // MarketplaceState.widgetOptions = <Widget>[
                      //   AllProducts(MarketplaceState.allProducts),
                      //   FavProducts(MarketplaceState.favProducts),
                      // ];
                      //MarketplaceState.;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Marketplace(all: ''),
                        ),
                      );
                      widget.favorited =
                          Marketplace.state.IsItFavorite(widget.id);
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
                    BuilderState.AddNewSmartDevice(widget.id);
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
