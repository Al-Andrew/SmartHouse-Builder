import 'dart:html';

import 'package:flutter/material.dart';
import './GradientText.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      height: 100,
      child: Center(
        child: GradientText(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            fontFamily: 'Barlow Condensed',
          ),
          gradient: LinearGradient(colors: [
            Colors.blue.shade400,
            Colors.blue.shade900,
          ]),
        ),
      ),
    );
  }
}
