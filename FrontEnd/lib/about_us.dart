import 'package:flutter/material.dart';
import 'package:homepage/widgets/HomepageBuildSection.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class AboutUs extends StatefulWidget {
  AboutUs();

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          HomepageBuildSection(),
          GradientText(
            'ABOUT',
            style: const TextStyle(
                fontSize: 50,
                color: Colors.cyan,
                fontFamily: 'BarlowCondensed'),
            colors: const [
              Colors.cyanAccent,
              Colors.cyan,
              Colors.indigo,
              //add mroe colors here.
            ],
          ),
        ])));
  }
}
