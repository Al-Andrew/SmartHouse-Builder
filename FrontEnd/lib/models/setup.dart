// import 'dart:math';

class UserSetup {
  final String id;
  final String nume;
  // final String linkImg;
  final void Function() addFn;
  // bool favorite;

  UserSetup(
      {required this.id,
      required this.nume,
      // this.linkImg = 'assets/error.png',
      required this.addFn});
  // this.favorite = false;
}
