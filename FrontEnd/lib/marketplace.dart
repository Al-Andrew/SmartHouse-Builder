// import 'dart:http';
import 'dart:convert';
import 'dart:io';
// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:homepage/all_products.dart';
// import 'package:homepage/schematics.dart';
// import 'package:flutter/rendering.dart';
// import 'package:homepage/dummy_products.dart';
// import 'package:homepage/dummy_schematics.dart';
import 'package:homepage/fav_products.dart';
import 'package:homepage/models/product.dart';
import 'package:homepage/widgets/SearchMarket.dart';

import '../global_variables.dart' as globals;
// import 'package:homepage/models/schematic.dart';
// import 'package:homepage/product_item.dart';
// import 'package:homepage/schematics_item.dart';
import 'package:http/http.dart' as http;

import 'forum/utilities/Utilities.dart';

class Marketplace extends StatefulWidget {
  static late MarketplaceState state;
  String all;

  Marketplace({required this.all});

  @override
  State<Marketplace> createState() => state = MarketplaceState();
}

class MarketplaceState extends State<Marketplace> {
  List<Product> _allProducts = [];
  List<Product> _favProducts = [];
  // List<Product> _searchedProducts = [];
  // int userId = 1;

  // List<Schematic> _allSchematics = DUMMY_SCHEMATICS;
  int _selectedIndex = 0;
  late List<Widget> widgetOptions;

  @override
  void initState() {
    // String query = '';
    fetchSearched(widget.all).then((value) {
      /*DO SOMETHING A.K.A update view*/
    }, onError: (err) => print(err));
    // _allProducts = DUMMY_PRODUCTS;
    fetchWishlist();

    widgetOptions = <Widget>[
      AllProducts(_allProducts),
      FavProducts(_favProducts),
    ];

    super.initState();
  }

  void changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> AddToFavorites(int idProdus) async {
    int productID = idProdus;
    int userId = globals.userID;
    final queryParameters = {
      'userId': '$userId',
      'productId': '$productID',
    };
    print(productID);
    print(userId);
    final uri = Uri.https('smart-house-builder.azurewebsites.net',
        '/api/wishlist/', queryParameters);
    // var headers = {
    //   HttpHeaders.authorizationHeader: 'Token $String',
    //   HttpHeaders.contentTypeHeader: 'application/json',
    // };

    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print('succes');
    }
    // print(response.body);
  }

  Future<void> RemoveFromFavorites(int idProdus) async {
    int productID = idProdus;
    int userId = globals.userID;
    final queryParameters = {
      'userId': '$userId',
      'productId': '$productID',
    };
    final uri = Uri.https('smart-house-builder.azurewebsites.net',
        '/api/wishlist/', queryParameters);
    final response = await http.delete(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print('succes');
    }
    // print(response.body);
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
            // pngUrl: info[i]["pngUrl"],
            // forumLink: info[i]["forumLink"],
            // productUrl: info[i]["productUrl"],
            // description: info[i]["description"],
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
            globals.userID.toString()));

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

  Future fetchSearched(String query) async {
    final response = await http.get(Uri.parse(
        'https://smart-house-builder.azurewebsites.net/api/products/name?string=' +
            query));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      var infoJson = jsonDecode(response.body);
      List? info = infoJson != null ? List.from(infoJson) : null;

      // _allProducts = List<Product>.from(
      //     json.decode(response.body).map((data) => Product.fromJson(data)));

      if (info != null) {
        var ind = info.length;
        print(ind);
        for (int i = 0; i < ind; i++) {
          _allProducts.add(Product(
            id: info[i]["id"],
            // categoryId: info[i]["categoryId"],
            name: info[i]["name"],
            price: info[i]["price"],
            // rating: info[i]["rating"],
            pngUrl: info[i]["pngUrl"],
            // forumLink: info[i]["forumLink"],
            productUrl: info[i]["productUrl"],
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
    print(ProductId);
    final ExistingIndex =
        _favProducts.indexWhere((Product) => Product.id == ProductId);
    if (ExistingIndex >= 0) {
      setState(() {
        // _favProducts.removeAt(ExistingIndex);
        RemoveFromFavorites(ProductId);
      });
    } else {
      setState(() {
        // _favProducts
        //     .add(_allProducts.firstWhere((Product) => Product.id == ProductId));
        AddToFavorites(ProductId);
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

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: Column(children: [
        Container(
            child: Column(children: [
          SearchMarket(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () => changeScreen(0),
                  // onPressed: () {
                  //   Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => AllProducts(_allProducts),
                  //     ),
                  //   );
                  // },
                  child: Text(
                    'All',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(1))),
              TextButton(
                  onPressed: () => changeScreen(1),
                  // onPressed: () {
                  //   Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => FavProducts(_favProducts),
                  //     ),
                  //   );
                  // },
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
        Expanded(child: widgetOptions.elementAt(_selectedIndex))
      ]),
    ));
  }
}
