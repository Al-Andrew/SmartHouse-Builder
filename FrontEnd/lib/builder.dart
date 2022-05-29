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
import 'package:flutter/services.dart';

//import 'package:flutter/cupertino.dart';

class BuilderCon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BuilderState();
  }
}

class BuilderState extends State<BuilderCon> {
  static var flameContext = Builder();

  static void AddNewWall() {
    flameContext.add(Wall());
  }

  static void AddNewWindow() {
    flameContext.add(Window());
  }

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: flameContext);
  }
}

class Builder extends FlameGame
    with HasTappables, HasDraggables, KeyboardEvents {
  @override
  Color backgroundColor() {
    return const Color.fromRGBO(245, 245, 245, 1.0);
  }

  @override
  Future<void>? onLoad() {
    add(Wall());
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    Paint paint = Paint();
    paint.color = const Color.fromRGBO(220, 220, 220, 0.8);
    paint.strokeWidth = 1;

    for (int i = 0; i < canvasSize.x; i += 25) {
      canvas.drawLine(
          Offset(i as double, 0), Offset(i as double, canvasSize.y), paint);
    }
    for (int i = 0; i < canvasSize.y; i += 25) {
      canvas.drawLine(
          Offset(0, i as double), Offset(canvasSize.x, i as double), paint);
    }
    super.render(canvas);
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

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyDown = event is RawKeyDownEvent;
    final isDelete = keysPressed.contains(LogicalKeyboardKey.delete);
    print("keyEvent");
    if (isDelete && isKeyDown) {
      for (var child in this.children) {
        if (child is! BaseSchematic) continue;

        BaseSchematic c = child as BaseSchematic;
        if (!c.isFocused) continue;

        remove(c.gizmoRef);
        remove(c);
      }
    }
    final isSpace = keysPressed.contains(LogicalKeyboardKey.space);
    if (isSpace && isKeyDown) {
      BuilderState.AddNewWall();
    }

    return KeyEventResult.ignored;
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
    paint.color = const Color.fromRGBO(55, 128, 215, 1.0);

    Rect selectRect = Offset.zero & Size(size.x, size.y);
    canvas.drawRect(selectRect, paint);
    paint.style = PaintingStyle.fill;
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
    //TODO(Al-Andrew): The transformations should be more intuitive
    //TODO(Al-Andrew): handle all sizing rs separatedly
    if (schematic.isFocused == false) return false;
    if (rs_topMid.contains(translatedEventPosition.toOffset()) ||
        rs_botMid.contains(translatedEventPosition.toOffset())) {
      dt = dragType.size_y;
    } else if (rs_midLeft.contains(translatedEventPosition.toOffset()) ||
        rs_midRight.contains(translatedEventPosition.toOffset())) {
      dt = dragType.size_x;
    } else if (rs_topLeft.contains(translatedEventPosition.toOffset()) ||
        rs_botLeft.contains(translatedEventPosition.toOffset()) ||
        rs_topRight.contains(translatedEventPosition.toOffset()) ||
        rs_botRight.contains(translatedEventPosition.toOffset())) {
      dt = dragType.rotate;
    } else {
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

    //TODO(Al-Andrew): handle all sizing rs separatedly
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
  late Gizmo gizmoRef;

  BaseSchematic(Vector2? position)
      : super(
            position: position ?? Vector2(100, 100), size: Vector2(100, 12.5));

  @override
  Future<void>? onLoad() {
    gizmoRef = Gizmo(this);
    parent?.add(gizmoRef);
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
    paint.color = Colors.black;
    paint.strokeWidth = 2;

    canvas.drawLine(
        Offset(0, paint.strokeWidth), Offset(size.x, paint.strokeWidth), paint);
    canvas.drawLine(Offset(0, size.y - paint.strokeWidth),
        Offset(size.x, size.y - paint.strokeWidth), paint);
    canvas.drawRect(
        Rect.fromLTWH(
          0,
          0,
          size.x / 4,
          size.y,
        ),
        paint);
    canvas.drawRect(
        Rect.fromLTWH(
          size.x * 0.75,
          0,
          size.x / 4,
          size.y,
        ),
        paint);
  }
}

class Wall extends BaseSchematic {
  Wall() : super(Vector2(100, 100));

  @override
  void render(Canvas canvas) {
    Paint paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = Colors.black;
    paint.strokeWidth = 4;

    Rect myRect = Offset.zero & Size(size.x, size.y);
    canvas.drawRect(myRect, paint);
  }
}
