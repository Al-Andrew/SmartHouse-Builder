import 'package:flutter/material.dart';
import 'package:homepage/models/schematic.dart';
import 'package:homepage/schematics_item.dart';
import 'package:homepage/dummy_schematics.dart';

class AllSchematics extends StatefulWidget {
  final List<Schematic> _allSchematics;
  AllSchematics(this._allSchematics);

  @override
  State<AllSchematics> createState() => _AllSchematicsState();
}

class _AllSchematicsState extends State<AllSchematics> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      children: widget._allSchematics
          .map((schData) => SchematicItem(
              schData.id, schData.title, schData.linkImg))
          .toList(),
    );
  }
}

/*

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:homepage/dummy_products.dart';
import 'package:homepage/models/product.dart';
import 'package:homepage/product_item.dart';

class AllProducts extends StatefulWidget {
  final List<Product> _allProducts;
  AllProducts(this._allProducts);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      children: widget._allProducts
          .map((proData) => ProductItem(
              proData.id, proData.title, proData.pret, proData.linkImg))
          .toList(),
    );
  }
}

@override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Container(
        color: Colors.green,
        child: Center(child: Text("Schematics")),
      ),
    );
  }
}

*/