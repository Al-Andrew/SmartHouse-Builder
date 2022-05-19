import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter/rendering.dart';
import 'package:homepage/dummy_products.dart';
import 'package:homepage/models/product.dart';
import 'package:homepage/product_item.dart';

class AllProducts extends StatefulWidget {
  final List<Product> _allProducts;
  int index = 0;
  AllProducts(this._allProducts);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final ScrollController _scrollController = ScrollController();
  bool loading = false;
  bool allLoaded = false;
  List<Product> displayedProducts = [];

  mockFetch() async {
    if (allLoaded) {
      return;
    }
    setState(() {
      loading = true;
    });
    await Future.delayed(Duration(milliseconds: 500));
    List<Product> newProducts = [];
    for (int i = widget.index; i <= widget.index + 10; i++) {
      newProducts.add(widget._allProducts.elementAt(i));
    }
    widget.index = widget.index + 10;
    if (newProducts.isNotEmpty) {
      displayedProducts.addAll(newProducts);
    }
    setState(() {
      loading = false;
      allLoaded = listEquals(displayedProducts, widget._allProducts);
    });
  }

  @override
  void initState() {
    super.initState();
    mockFetch();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !loading) {
        mockFetch();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (displayedProducts.isNotEmpty) {
      return Stack(
        alignment: Alignment.center,

        children: [
          ListView(
            controller: _scrollController,
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            children: displayedProducts
                .map((proData) => ProductItem(
                    proData.id, proData.title, proData.pret, proData.linkImg))
                .toList(),
          ),
          if (loading)...[
          Positioned(
              // left: 0,
              bottom: 0,
              child: Container(
                  child:  Center(child: CircularProgressIndicator()),
                  height: 80,
                ),
              )]
        ],
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}
