// import 'package:homepage/shb.dart';
import 'package:flutter/material.dart';
import 'package:homepage/widgets/HomepageBuildSection.dart';
import 'package:homepage/widgets/HouseLeaderboard.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      HomepageBuildSection(),
      HouseLeaderboard(),
    ])));
  }
}
