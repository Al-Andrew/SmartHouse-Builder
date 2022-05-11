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
