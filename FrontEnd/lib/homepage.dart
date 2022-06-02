// import 'package:homepage/shb.dart';
import 'package:flutter/material.dart';
import 'package:homepage/widgets/HomepageBuildSection.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: const [
      HomepageBuildSection(),
      //HouseLeaderboard(),
    ])));
  }
}
