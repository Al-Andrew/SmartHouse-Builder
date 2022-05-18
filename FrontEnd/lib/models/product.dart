// import 'dart:math';

class Product {
  final String id;
  final String title;
  final int pret;
  final String linkImg;
  // bool favorite;

  const Product(
      {required this.id,
      required this.title,
      this.pret = 0,
      this.linkImg = 'assets/error.png'});
  // this.favorite = false;
}
