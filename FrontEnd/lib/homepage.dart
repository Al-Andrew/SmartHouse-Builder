// import 'package:homepage/shb.dart';
import 'package:flutter/material.dart';
import 'package:homepage/shb.dart';
import 'package:homepage/main.dart';
import 'package:homepage/marketplace.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

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
      Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 4 / 10,
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('CREATE YOUR HOUSE',
                    style:
                        TextStyle(fontSize: 50, fontFamily: 'BarlowCondensed')),
                GradientText(
                  'THE SMART WAY',
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
                Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(color: Colors.black)),
                      onPressed: () => {},
                      child: const Center(
                          child: Text('Build',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontFamily: 'BebasNeuePro'))),
                    )),
              ],
            )),
          ),
          Container(
            height: 600,
            width: MediaQuery.of(context).size.width * 6 / 10,
            child: const Image(
              image: AssetImage('assets/BLOB.png'),
              alignment: Alignment.centerRight,
              // fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
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
