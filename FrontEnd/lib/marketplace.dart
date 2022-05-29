import 'dart:convert';
// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:homepage/all_products.dart';
// import 'package:homepage/schematics.dart';
// import 'package:flutter/rendering.dart';
import 'package:homepage/dummy_products.dart';
// import 'package:homepage/dummy_schematics.dart';
import 'package:homepage/fav_products.dart';
import 'package:homepage/models/product.dart';
// import 'package:homepage/models/schematic.dart';
// import 'package:homepage/product_item.dart';
// import 'package:homepage/schematics_item.dart';
import 'package:http/http.dart' as http;

import 'forum/utilities/Utilities.dart';

class Marketplace extends StatefulWidget {
  Marketplace();

  @override
  State<Marketplace> createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
  List<Product> _allProducts = [];
  // List<Schematic> _allSchematics = DUMMY_SCHEMATICS;
  List<Product> _favoriteProducts = [];

  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    _widgetOptions = <Widget>[
      AllProducts(_allProducts),
      FavProducts(_favoriteProducts),
    ];
    fetchProducts();
    super.initState();
  }

  void changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void fetchProducts() async {
    final response = await http.get(Uri.parse(
        'https://smart-house-builder.azurewebsites.net/api/products/all'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var infoJson = jsonDecode(response.body);
      List? info = infoJson != null ? List.from(infoJson) : null;

      // _allProducts = List<Product>.from(
      //     json.decode(response.body).map((data) => Product.fromJson(data)));

      if (info != null) {
        var ind = info.length;
        for (int i = 0; i < ind; i++) {
          _allProducts.add(Product(
            id: info[i]["id"],
            // categoryId: info[i]["categoryId"],
            name: info[i]["name"],
            // price: info[i]["price"],
            // rating: info[i]["rating"],
            pngUrl: info[i]["pngUrl"],
            // forumLink: info[i]["forumLink"],
            // productUrl: info[i]["productUrl"],
            description: info[i]["description"],
            // specifications: info[i]["specification"]
          ));
        }
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load product');
    }
  }

  // void ToggleFavorite(int ProductId) {
  //   final ExistingIndex =
  //       _favoriteProducts.indexWhere((Product) => Product.id == ProductId);
  //   if (ExistingIndex >= 0) {
  //     setState(() {
  //       _favoriteProducts.removeAt(ExistingIndex);
  //     });
  //   } else {
  //     setState(() {
  //       _allProducts
  //           .add(_allProducts.firstWhere((Product) => Product.id == ProductId));
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: Column(children: [
        Container(
            child: Column(children: [
          SearchBar(),
          Center(
            child: TextButton(
                onPressed: null,
                child: Text('Filters'),
                style: ButtonStyle(elevation: MaterialStateProperty.all(1))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () => changeScreen(0),
                  child: Text(
                    'All',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(elevation: MaterialStateProperty.all(1))),
              TextButton(
                  onPressed: () => changeScreen(1),
                  child: Text(
                    'Wishlist',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(elevation: MaterialStateProperty.all(1))),
            ],
          ),
        ])),
        Expanded(child: _widgetOptions.elementAt(_selectedIndex))
      ]),
    ));
  }
}
