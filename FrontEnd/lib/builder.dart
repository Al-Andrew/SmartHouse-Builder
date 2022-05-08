import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';

class BuilderCon extends StatefulWidget {
  @override
  BuilderState createState() => BuilderState();
}

class BuilderState extends State<BuilderCon> {
  List<Wall> walls = [];
  List<Window> windows = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: CustomPaint(
        size: MediaQuery.of(ctx).size,
        painter: BuilderPainter(walls: walls, windows: windows),
        child: GestureDetector(
          onTapDown: (details) {
            bool windowClicked = false;
            bool wallClicked = false;
            for (Window w in windows)
              if (w.isClicked(details.localPosition) == true)
                windowClicked = true;
            for (Wall w in walls)
              if (w.isClicked(details.localPosition) == true)
                windowClicked = true;
            print(windowClicked);
            print(wallClicked);
            if (wallClicked == false && windowClicked == false) {
              //aici trebuie sa stabilim cum facem switch de la un obiect la altul, era vorba sa se vorbeasca la alta echipa de modificarea unui meniu
              walls.add(Wall(
                  p1: details.localPosition + Offset(0, 50),
                  p2: details.localPosition - Offset(0, 50)));
              /*windows.add(Window(
                  p1: details.localPosition + Offset(5, 50),
                  p2: details.localPosition - Offset(5, 50),
                  p3: details.localPosition + Offset(-5, 50),
                  p4: details.localPosition - Offset(-5, 50)));*/
            }
          },
        ),
      ),
    );
  }
}

//mai trebui adaugate usile
class Window {
  Offset p1, p2, p3, p4;

  static final Paint paint = Paint()
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..color = Colors.black
    ..strokeWidth = 1;
  bool isClicked(Offset clickPosition) {
    double min_dx, min_dy, max_dx, max_dy;
    min_dx = min(p1.dx, min(p2.dx, min(p3.dx, p4.dx)));
    max_dx = max(p1.dx, max(p2.dx, max(p3.dx, p4.dx)));
    min_dy = min(p1.dy, min(p2.dy, min(p3.dy, p4.dy)));
    max_dy = max(p1.dy, max(p2.dy, max(p3.dy, p4.dy)));
    if (clickPosition.dx <= max_dx &&
        clickPosition.dx >= min_dx &&
        clickPosition.dy <= max_dy &&
        clickPosition.dy >= min_dy) {
      ///am apasat un window
      return true;
    }
    return false;
  }

  Window(
      {required this.p1, required this.p2, required this.p3, required this.p4});
}

class Wall {
  Offset p1, p2;
  static final Paint paint = Paint()
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..color = Colors.black
    ..strokeWidth = 5;
  bool isClicked(Offset clickPosition) {
    double min_dx, min_dy, max_dx, max_dy;
    min_dx = min(p1.dx, p2.dx);
    max_dx = max(p1.dx, p2.dx);
    min_dy = min(p1.dy, p2.dy);
    max_dy = max(p1.dy, p2.dy);
    if (clickPosition.dx <= max_dx &&
        clickPosition.dx >= min_dx &&
        clickPosition.dy <= max_dy &&
        clickPosition.dy >= min_dy) {
      ///am apasat un wall
      return true;
    }
    return false;
  }

  Wall({required this.p1, required this.p2});
}

class BuilderPainter extends CustomPainter {
  List<Wall> walls;
  List<Window> windows;
  BuilderPainter({required this.walls, required this.windows});

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Color.fromARGB(161, 189, 24, 24);
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);
    canvas.clipRect(rect);
    for (Wall w in walls) {
      canvas.drawLine(w.p1, w.p2, Wall.paint);
    }
    for (Window w in windows) {
      canvas.drawLine(w.p1, w.p4, Wall.paint);
      canvas.drawLine(w.p2, w.p3, Wall.paint);
    }
  }

  @override
  bool shouldRepaint(BuilderPainter oldDelegate) =>
      oldDelegate.walls != walls || oldDelegate.windows != windows;
}
