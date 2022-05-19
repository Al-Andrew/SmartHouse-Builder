// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'dart:math' as math;

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart' hide Draggable;

//import 'package:flutter/cupertino.dart';

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
    add(Window());
    add(Window()..y = 350);
    add(Wall()
      ..y = 350
      ..x = 400);
    add(Wall()..x = 400);
    return super.onLoad();
  }

  @override
  void onTapUp(int pointerId, TapUpInfo info) {
    propagateToChildren(
      (Tappable child) => child.handleTapUp(pointerId, info),
    );
  }
}

class Window extends PositionComponent with Draggable, Tappable {
  @override
  bool debugMode = false;

  Window({Vector2? position})
      : super(
          position: position ?? Vector2(100, 200),
          size: Vector2(200, 20),
        );

  Vector2? dragDeltaPosition;
  bool get isDragging => dragDeltaPosition != null;

  @override
  void update(double dt) {
    super.update(dt);
    debugColor = isDragging ? Colors.greenAccent : Colors.purple;
  }

  @override
  bool onDragStart(DragStartInfo info) {
    dragDeltaPosition = info.eventPosition.game - position;
    return false;
  }

  @override
  bool onDragUpdate(DragUpdateInfo event) {
    final dragDeltaPosition = this.dragDeltaPosition;
    if (dragDeltaPosition == null) {
      return false;
    }

    position.setFrom(event.eventPosition.game - dragDeltaPosition);
    return false;
  }

  @override
  bool onDragEnd(_) {
    dragDeltaPosition = null;
    return false;
  }

  @override
  bool onDragCancel() {
    dragDeltaPosition = null;
    return false;
  }

  @override
  void render(Canvas canvas) {
    Paint paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = Colors.red;
    paint.strokeWidth = 4;

    canvas.drawLine(Offset.zero, Offset(size.x, 0), paint);
    canvas.drawLine(Offset(0, size.y), Offset(size.x, size.y), paint);
  }

  @override
  bool onTapUp(TapUpInfo info) {
    print("asdasd");
    var swp = size.x;
    size.x = size.y;
    size.y = swp;
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

class Wall extends PositionComponent with Draggable, Tappable {
  @override
  bool debugMode = false;
  Wall({Vector2? position})
      : super(
          position: position ?? Vector2(100, 200),
          size: Vector2(200, 24),
        );

  Vector2? dragDeltaPosition;
  bool get isDragging => dragDeltaPosition != null;

  @override
  void update(double dt) {
    super.update(dt);
    debugColor = isDragging ? Colors.greenAccent : Colors.purple;
  }

  @override
  bool onDragStart(DragStartInfo info) {
    dragDeltaPosition = info.eventPosition.game - position;
    return false;
  }

  @override
  bool onDragUpdate(DragUpdateInfo event) {
    final dragDeltaPosition = this.dragDeltaPosition;
    if (dragDeltaPosition == null) {
      return false;
    }

    position.setFrom(event.eventPosition.game - dragDeltaPosition);
    return false;
  }

  @override
  bool onDragEnd(_) {
    dragDeltaPosition = null;
    return false;
  }

  @override
  bool onDragCancel() {
    dragDeltaPosition = null;
    return false;
  }

  @override
  void render(Canvas canvas) {
    Paint paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = Colors.red;

    //print("Position" + this.position.toString());
    Rect myRect = Offset.zero & Size(size.x, size.y);
    canvas.drawRect(myRect, paint);
  }

  @override
  bool onTapUp(TapUpInfo info) {
    print("asdasd");
    var swp = size.x;
    size.x = size.y;
    size.y = swp;
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
