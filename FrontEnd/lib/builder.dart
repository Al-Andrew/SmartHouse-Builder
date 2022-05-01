import 'dart:html';

import 'package:flutter/material.dart';

class BuilderCon extends StatefulWidget {
  @override
  BuilderState createState() => BuilderState();
}

class BuilderState extends State<BuilderCon> {
  List<Wall> walls = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: CustomPaint(
        size: MediaQuery.of(ctx).size,
        painter: BuilderPainter(walls: walls),
        child: GestureDetector(
          onTapDown: (details) {
            walls.add(Wall(
                p1: details.localPosition + Offset(0, 50),
                p2: details.localPosition - Offset(0, 50)));
          },
        ),
      ),
    );
  }
}

class Wall {
  Offset p1, p2;
  static final Paint paint = Paint()
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..color = Colors.black
    ..strokeWidth = 5;

  Wall({required this.p1, required this.p2});
}

class BuilderPainter extends CustomPainter {
  List<Wall> walls;

  BuilderPainter({required this.walls});

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Color.fromARGB(161, 189, 24, 24);
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);
    canvas.clipRect(rect);

    for (Wall w in walls) {
      canvas.drawLine(w.p1, w.p2, Wall.paint);
    }
  }

  @override
  bool shouldRepaint(BuilderPainter oldDelegate) => oldDelegate.walls != walls;
}
