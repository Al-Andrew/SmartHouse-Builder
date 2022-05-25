// import 'dart:math';

// import 'dart:ffi';

class Product {
  final int id;
  final int categoryId;
  final String name;
  double price;
  double rating;
  String pngUrl;
  String forumLink;
  String productUrl;
  String description;
  String specifications;
  // bool favorite;

  Product({
    required this.id,
    this.categoryId = 0,
    required this.name,
    this.price = 0,
    this.rating = 0,
    this.pngUrl = './assets/error.png',
    this.forumLink = 'null',
    this.productUrl = 'null',
    this.description = 'descriere',
    this.specifications = 'null',
  });
  // this.favorite = false;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      categoryId: json['categoryId'],
      name: json['name'],
      price: json['price'],
      rating: json['rating'],
      pngUrl: json['pngUrl'],
      forumLink: json['forumLink'],
      productUrl: json['productUrl'],
      description: json['description'],
      specifications: json['specifications'],
    );
  }
}
