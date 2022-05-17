// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'dart:math' as math;

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class BuilderCon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BuilderState();
  }
}

class BuilderState extends State<BuilderCon> {
  var flameContext = Builder();

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: flameContext);
  }
}

class Builder extends FlameGame with HasTappables, HasDraggables {
  @override
  Future<void>? onLoad() {
    add(Wall());
    return super.onLoad();
  }

  @override
  void onTapUp(int pointerId, TapUpInfo info) {
    propagateToChildren(
      (Tappable child) => child.handleTapUp(pointerId, info),
    );
  }
}

class Wall extends PositionComponent with Tappable {
  Wall() {
    this.positionType = PositionType.widget;
    this.position.setValues(200, 200);
    this.size.setValues(200, 10);
  }

  @override
  void render(Canvas canvas) {
    Paint paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = Colors.red;

    //print("Position" + this.position.toString());

    Rect rect = Rect.fromLTWH(
        this.position.x, this.position.y, this.size.x, this.size.y);

    canvas.drawRect(rect, paint);
  }

  @override
  bool containsPoint(Vector2 point) {
    print("Check colision: " + point.toString());
    print("Position" + this.position.toString());
    print("Size: " + this.size.toString());
    return (point.x >= this.position.x &&
        point.x <= this.position.x + this.size.x &&
        point.y >= this.position.y &&
        point.y <= this.position.y + this.size.y);
  }

  @override
  bool onTapUp(TapUpInfo info) {
    print("TAPPED");
    return true;
  }

  @override
  bool handleTapUp(int pointerId, TapUpInfo info) {
    if (containsPoint(info.eventPosition.widget)) {
      return onTapUp(info);
    }
    return false;
  }
}
