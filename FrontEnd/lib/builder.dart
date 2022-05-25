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
    //add(Window());
    //add(Window()..y = 350);
    //add(Wall()
    //  ..y = 350
    //  ..x = 400);
    add(Window());
    return super.onLoad();
  }

  @override
  void onTapUp(int pointerId, TapUpInfo info) {
    for (var child in children) {
      if (child is BaseSchematic) {
        child.isFocused = false;
      }
    }
    propagateToChildren(
      (Tappable child) => child.handleTapUp(pointerId, info),
    );
  }
}

enum dragType { translate, rotate, size_x, size_y, none }

class Gizmo extends PositionComponent with Draggable {
  late BaseSchematic schematic;
  //NOTE(Al-Andrew): I know this is stupid but it works so don't @me
  static const Size rsSize = Size(10, 10);
  static Vector2 vrsSize = Vector2(10, 10);
  late Rect rs_topLeft;
  late Rect rs_midLeft;
  late Rect rs_botLeft;
  late Rect rs_topRight;
  late Rect rs_midRight;
  late Rect rs_botRight;
  late Rect rs_topMid;
  late Rect rs_botMid;
  Vector2 margin = Vector2(30, 60);
  dragType dt = dragType.none;

  Gizmo(BaseSchematic schematic) {
    this.schematic = schematic;
    this.transform.setFrom(schematic.transform);
    this.size.setFrom(schematic.size);
    this.size.add(margin);
    this.anchor = Anchor(0.5, 0.5);
    this.schematic.anchor = Anchor(0.5, 0.5);
    fixToSchematic();
  }

  Vector2 rsMargin = Vector2.zero();

  void updateRS() {
    rs_topLeft = Offset(-rsMargin.x, -rsMargin.y) & rsSize;
    rs_midLeft = Offset(-rsMargin.x, this.size.y / 2 - vrsSize.y / 2) & rsSize;
    rs_botLeft = Offset(-rsMargin.x, this.size.y - vrsSize.y) & rsSize;
    rs_topRight = Offset(this.size.x - vrsSize.x, -rsMargin.y) & rsSize;
    rs_midRight =
        Offset(this.size.x - vrsSize.x, this.size.y / 2 - vrsSize.y / 2) &
            rsSize;
    rs_botRight =
        Offset(this.size.x - vrsSize.x, this.size.y - vrsSize.y) & rsSize;
    rs_topMid = Offset(this.size.x / 2, 0) & rsSize;
    rs_botMid = Offset(this.size.x / 2, this.size.y - vrsSize.y) & rsSize;
  }

  void fixToSchematic() {
    schematic.updateTransform(this.transform, this.size - margin);
    updateRS();
  }

  @override
  void render(Canvas canvas) {
    if (schematic.isFocused == false) return;
    Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.color = Colors.cyan;

    Rect selectRect = Offset.zero & Size(size.x, size.y);
    canvas.drawRect(selectRect, paint);
    paint.style = PaintingStyle.fill;
    paint.color = Colors.blue;
    canvas.drawRect(rs_topLeft, paint);
    canvas.drawRect(rs_midLeft, paint);
    canvas.drawRect(rs_botLeft, paint);
    canvas.drawRect(rs_topRight, paint);
    canvas.drawRect(rs_midRight, paint);
    canvas.drawRect(rs_botRight, paint);
    canvas.drawRect(rs_topMid, paint);
    canvas.drawRect(rs_botMid, paint);
  }

  Vector2? dragDelta;
  Vector2? dragDeltaPosition;
  double startSizeX = 0;
  double startSizeY = 0;
  double startAngle = 0;
  bool get isDragging => dragDeltaPosition != null;

  @override
  void update(double dt) {
    super.update(dt);
    debugColor = isDragging ? Colors.greenAccent : Colors.purple;
  }

  @override
  bool onDragStart(DragStartInfo info) {
    Vector2 translatedEventPosition =
        this.transform.globalToLocal(info.eventPosition.game);

    if (schematic.isFocused == false) return false;
    if (rs_topMid.contains(translatedEventPosition.toOffset()) ||
        rs_botMid.contains(translatedEventPosition.toOffset())) {
      print("drag size y");
      dt = dragType.size_y;
    } else if (rs_midLeft.contains(translatedEventPosition.toOffset()) ||
        rs_midRight.contains(translatedEventPosition.toOffset())) {
      print("drag size x");
      dt = dragType.size_x;
    } else if (rs_topLeft.contains(translatedEventPosition.toOffset()) ||
        rs_botLeft.contains(translatedEventPosition.toOffset()) ||
        rs_topRight.contains(translatedEventPosition.toOffset()) ||
        rs_botRight.contains(translatedEventPosition.toOffset())) {
      print("drag rotate");
      dt = dragType.rotate;
    } else {
      print("drag translate");
      dt = dragType.translate;
    }
    dragDeltaPosition = info.eventPosition.game - position;
    startAngle = this.transform.angle;
    startSizeX = size.x;
    startSizeY = size.y;
    return false;
  }

  @override
  bool onDragUpdate(DragUpdateInfo event) {
    Vector2 translatedEventPosition =
        this.transform.globalToLocal(event.eventPosition.game);

    final dragDeltaPosition = this.dragDeltaPosition;
    if (dragDeltaPosition == null) {
      return false;
    }

    if (this.dt == dragType.translate) {
      position.setFrom(event.eventPosition.game - dragDeltaPosition);
    } else if (this.dt == dragType.size_y) {
      size.setFrom(Vector2(size.x, startSizeY - translatedEventPosition.y));
    } else if (this.dt == dragType.size_x) {
      size.setFrom(Vector2(startSizeX - translatedEventPosition.x, size.y));
    } else if (this.dt == dragType.rotate) {
      this.transform.angle = startAngle - translatedEventPosition.y / 108;
    }

    fixToSchematic();
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
}

class BaseSchematic extends PositionComponent with Tappable {
  @override
  bool debugMode = false;
  bool isFocused = false;

  BaseSchematic(Vector2? position)
      : super(position: position ?? Vector2(100, 100), size: Vector2(100, 10));

  @override
  Future<void>? onLoad() {
    parent?.add(Gizmo(this));
    return super.onLoad();
  }

  updateTransform(Transform2D transform2d, Vector2 size) {
    super.transform.setFrom(transform2d);
    super.size.setFrom(size);
    this.transform.setFrom(transform2d);
    this.size.setFrom(size);
  }

  @override
  bool onTapUp(TapUpInfo info) {
    isFocused = true;
    return true;
  }

  @override
  void render(Canvas canvas);
}

class Window extends BaseSchematic {
  Window() : super(Vector2(100, 100));

  @override
  void render(Canvas canvas) {
    Paint paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = Colors.red;
    paint.strokeWidth = 4;

    canvas.drawLine(Offset.zero, Offset(size.x, 0), paint);
    canvas.drawLine(Offset(0, size.y), Offset(size.x, size.y), paint);
  }
}


//class Window extends PositionComponent with Draggable, Tappable {
//  @override
//  bool debugMode = false;
//
//  Window({Vector2? position})
//      : super(
//          position: position ?? Vector2(100, 200),
//          size: Vector2(200, 20),
//        );
//
//  Vector2? dragDeltaPosition;
//  bool get isDragging => dragDeltaPosition != null;
//
//  @override
//  void update(double dt) {
//    super.update(dt);
//    debugColor = isDragging ? Colors.greenAccent : Colors.purple;
//  }
//
//  @override
//  bool onDragStart(DragStartInfo info) {
//    dragDeltaPosition = info.eventPosition.game - position;
//    return false;
//  }
//
//  @override
//  bool onDragUpdate(DragUpdateInfo event) {
//    final dragDeltaPosition = this.dragDeltaPosition;
//    if (dragDeltaPosition == null) {
//      return false;
//    }
//
//    position.setFrom(event.eventPosition.game - dragDeltaPosition);
//    return false;
//  }
//
//  @override
//  bool onDragEnd(_) {
//    dragDeltaPosition = null;
//    return false;
//  }
//
//  @override
//  bool onDragCancel() {
//    dragDeltaPosition = null;
//    return false;
//  }
//
//  @override
//  void render(Canvas canvas) {
//    Paint paint = Paint();
//    paint.style = PaintingStyle.fill;
//    paint.color = Colors.red;
//    paint.strokeWidth = 4;
//
//    canvas.drawLine(Offset.zero, Offset(size.x, 0), paint);
//    canvas.drawLine(Offset(0, size.y), Offset(size.x, size.y), paint);
//  }
//
//  @override
//  bool onTapUp(TapUpInfo info) {
//    print("asdasd");
//    var swp = size.x;
//    size.x = size.y;
//    size.y = swp;
//    return true;
//  }
//
//  @override
//  bool handleTapUp(int pointerId, TapUpInfo info) {
//    if (containsPoint(info.eventPosition.widget)) {
//      return onTapUp(info);
//    }
//    return false;
//  }
//}
//
//class Wall extends PositionComponent with Draggable, Tappable {
//  @override
//  bool debugMode = false;
//  Wall({Vector2? position})
//      : super(
//          position: position ?? Vector2(100, 200),
//          size: Vector2(200, 24),
//        );
//
//  Vector2? dragDeltaPosition;
//  bool get isDragging => dragDeltaPosition != null;
//
//  @override
//  void update(double dt) {
//    super.update(dt);
//    debugColor = isDragging ? Colors.greenAccent : Colors.purple;
//  }
//
//  @override
//  bool onDragStart(DragStartInfo info) {
//    dragDeltaPosition = info.eventPosition.game - position;
//    return false;
//  }
//
//  @override
//  bool onDragUpdate(DragUpdateInfo event) {
//    final dragDeltaPosition = this.dragDeltaPosition;
//    if (dragDeltaPosition == null) {
//      return false;
//    }
//
//    position.setFrom(event.eventPosition.game - dragDeltaPosition);
//    return false;
//  }
//
//  @override
//  bool onDragEnd(_) {
//    dragDeltaPosition = null;
//    return false;
//  }
//
//  @override
//  bool onDragCancel() {
//    dragDeltaPosition = null;
//    return false;
//  }
//
//  @override
//  void render(Canvas canvas) {
//    Paint paint = Paint();
//    paint.style = PaintingStyle.fill;
//    paint.color = Colors.red;
//
//    //print("Position" + this.position.toString());
//    Rect myRect = Offset.zero & Size(size.x, size.y);
//    canvas.drawRect(myRect, paint);
//  }
//
//  @override
//  bool onTapUp(TapUpInfo info) {
//    print("asdasd");
//    var swp = size.x;
//    size.x = size.y;
//    size.y = swp;
//    return true;
//  }
//
//  @override
//  bool handleTapUp(int pointerId, TapUpInfo info) {
//    if (containsPoint(info.eventPosition.widget)) {
//      return onTapUp(info);
//    }
//    return false;
//  }
//}
//