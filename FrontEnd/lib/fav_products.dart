import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:homepage/dummy_products.dart';
import 'package:homepage/models/product.dart';
import 'package:homepage/product_item.dart';

class FavProducts extends StatefulWidget {
  final List<Product> _favProducts;
  FavProducts(this._favProducts);

  @override
  State<FavProducts> createState() => _FavProductsState();
}

class _FavProductsState extends State<FavProducts> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      children: widget._favProducts
          .map((proData) => ProductItem(
              proData.id, proData.title, proData.pret, proData.linkImg))
          .toList(),
    );
  }
}
