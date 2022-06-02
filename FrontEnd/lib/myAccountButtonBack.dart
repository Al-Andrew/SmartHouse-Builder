import 'package:flutter/material.dart';
import 'package:homepage/global_variables.dart';
import 'package:homepage/main.dart';

class MyAccountButtonBack extends StatefulWidget {
  const MyAccountButtonBack({
    Key? key,
    required this.context,
    required this.width,
    required this.height,
    required this.route,
  }) : super(key: key);

  final BuildContext context;
  final double width;
  final double height;
  final String route;

  @override
  State<MyAccountButtonBack> createState() => _MyAccountButtonBackState();
}

class _MyAccountButtonBackState extends State<MyAccountButtonBack> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      height: widget.height,
      width: widget.width,
      child: Ink(
        child: IconButton(
          onPressed: () {
            if (lastSelectedIndex == 8 || lastSelectedIndex == 9) {
              lastSelectedIndex = 7;
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyApp(
                            selectedIndex: 7,
                          )));
            }
          },
          icon: const Icon(Icons.arrow_back),
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 109, 184, 245),
              Color.fromARGB(255, 37, 108, 214),
            ],
          ),
        ),
      ),
    );
  }
}
