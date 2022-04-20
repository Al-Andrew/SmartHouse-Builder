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
      body: Column(children: [
        Container (child: Column(children: [ListTile(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          
          children: [
            TextButton(
                onPressed: null,
                child: Text('Filters'),
                style: ButtonStyle(elevation: MaterialStateProperty.all(1))),
            TextButton(
                onPressed: null,
                child: Text('Wishlist'),
                style: ButtonStyle(elevation: MaterialStateProperty.all(1))),
          ],
        ),])),
        SingleChildScrollView( child: Column(
          children: DUMMY_PRODUCTS
              .map((proData) => ProductItem(
                  proData.id, proData.title, proData.pret, proData.linkImg))
              .toList(),
        )
      )]),
    ));
  }
}
