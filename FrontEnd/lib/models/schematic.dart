// import 'dart:math';

class Schematic {
  final String id;
  final String title;
  final String linkImg;
  final void Function() addFn;
  // bool favorite;

  const Schematic(
      {required this.id,
      required this.title,
      this.linkImg = 'assets/error.png',
      required this.addFn});
  // this.favorite = false;
}
