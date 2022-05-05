// import 'package:homepage/shb.dart';
import 'package:flutter/material.dart';
import 'package:homepage/widgets/HomepageBuildSection.dart';

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
      Container(
        width: MediaQuery.of(context).size.width,
        height: 400,
        child: CustomPaint(
          painter: OpenPainter(),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: CustomPaint(
          painter: OpenPainter2(),
        ),
      )
    ])));
  }
}

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(0xff23262d)
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset(0, 100) & const Size(2000, 400), paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class OpenPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(0xffffffff)
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset(0, 100) & const Size(1500, 300), paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
