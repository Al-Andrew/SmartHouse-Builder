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
import 'package:homepage/widgets/SearchMarket.dart';
// import 'package:homepage/models/schematic.dart';
// import 'package:homepage/product_item.dart';
// import 'package:homepage/schematics_item.dart';
import 'package:http/http.dart' as http;

import 'forum/utilities/Utilities.dart';

class Marketplace extends StatefulWidget {
  static late MarketplaceState state;

  Marketplace();

  @override
  // ignore: no_logic_in_create_state
  State<Marketplace> createState() => state = MarketplaceState();
}

class MarketplaceState extends State<Marketplace> {
  List<Product> _allProducts = [];
  final List<Product> _favProducts = [];
  List<Product> _displayedProducts = [];
  int userId = 1;

  // List<Schematic> _allSchematics = DUMMY_SCHEMATICS;
  String query = '';

  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    fetchProducts();
    _allProducts = DUMMY_PRODUCTS;
    fetchWishlist();
    _displayedProducts = _allProducts;
    _widgetOptions = <Widget>[
      AllProducts(_displayedProducts),
      FavProducts(_favProducts),
    ];
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

  void fetchWishlist() async {
    final response = await http.get(Uri.parse(
        'https://smart-house-builder.azurewebsites.net/api/wishlist/userId?userId=' +
            userId.toString()));

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
          _favProducts.add(Product(
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

  void ToggleFavorite(int ProductId) {
    final ExistingIndex =
        _favProducts.indexWhere((Product) => Product.id == ProductId);
    if (ExistingIndex >= 0) {
      setState(() {
        _favProducts.removeAt(ExistingIndex);
      });
    } else {
      setState(() {
        _favProducts
            .add(_allProducts.firstWhere((Product) => Product.id == ProductId));
      });
    }
  }

  bool IsItFavorite(int ProductId) {
    final ExistingIndex =
        _favProducts.indexWhere((Product) => Product.id == ProductId);
    if (ExistingIndex >= 0) {
      return true;
    } else {
      return false;
    }
  }

  Widget marketSearch() => SearchMarket(text: query, onChanged: searchProducts);

  void searchProducts(String query) {
    final searchedProducts = _allProducts.where((product) {
      final nameLower = product.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this._displayedProducts = searchedProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: Column(children: [
        Container(
            child: Column(children: [
          marketSearch(),
          Center(
            child: TextButton(
                onPressed: null,
                child: Text('Filters'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    elevation: MaterialStateProperty.all(1))),
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
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(1))),
              TextButton(
                  onPressed: () => changeScreen(1),
                  child: Text(
                    'Wishlist',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(1))),
            ],
          ),
        ])),
        Expanded(child: _widgetOptions.elementAt(_selectedIndex))
      ]),
    ));
  }
}
