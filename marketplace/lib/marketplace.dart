import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:marketplace/dummy_products.dart';
import 'package:marketplace/product_item.dart';

class Marketplace extends StatefulWidget {
  Marketplace();

  @override
  State<Marketplace> createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: Center(
          child: ListView(
        children: DUMMY_PRODUCTS
            .map((proData) => ProductItem(
                proData.id, proData.title, proData.pret, proData.linkImg))
            .toList(),
      )),
    ));
  }
}
