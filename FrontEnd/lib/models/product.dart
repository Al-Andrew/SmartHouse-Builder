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
      this.linkImg =
          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Error.svg/1200px-Error.svg.png"});
      // this.favorite = false;
}
