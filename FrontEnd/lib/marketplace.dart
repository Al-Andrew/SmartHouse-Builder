import 'package:flutter/material.dart';
import 'package:homepage/all_products.dart';
// import 'package:flutter/rendering.dart';
import 'package:homepage/dummy_products.dart';
import 'package:homepage/fav_products.dart';
import 'package:homepage/models/product.dart';
import 'package:homepage/product_item.dart';

class Marketplace extends StatefulWidget {
  Marketplace();

  @override
  State<Marketplace> createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
  List<Product> _allProducts = DUMMY_PRODUCTS;
  List<Product> _favoriteProducts = [];

  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    _widgetOptions = <Widget>[
      AllProducts(_allProducts),
      FavProducts(_favoriteProducts),
    ];
    super.initState();
  }

  void changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void ToggleFavorite(String ProductId) {
    final ExistingIndex =
        _favoriteProducts.indexWhere((Product) => Product.id == ProductId);
    if (ExistingIndex >= 0) {
      setState(() {
        _favoriteProducts.removeAt(ExistingIndex);
      });
    } else {
      setState(() {
        _favoriteProducts.add(
            DUMMY_PRODUCTS.firstWhere((Product) => Product.id == ProductId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
        child: Scaffold(
      body: Column(children: [
        Container(
            child: Column(children: [
          ListTile(
              title: TextField(
                controller: TextEditingController(text: ''),
                decoration: InputDecoration(
                  // prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8.0),
                  hintText: 'Search',
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  new IconButton(
                      onPressed: null, icon: Icon(Icons.search_outlined))
                ],
              )),
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
