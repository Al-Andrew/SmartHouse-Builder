import 'package:flame/components.dart' as flame_components;
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BuilderCon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BuilderState();
  }
}

class BuilderState extends State<BuilderCon> {
  var game = DragDemoGame();
  @override
  Widget build(BuildContext context) {
    return GameWidget(game: game);
  }
}

class DragDemoGame extends FlameGame {
  late flame_components.SpriteAnimation wallRun;
  late wallComponent wall;

  // DragDemoGame({required this.zoom});
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    flame_components.SpriteAnimationData frameData =
        flame_components.SpriteAnimationData.sequenced(
            amount: 10, stepTime: .05, textureSize: Vector2(94, 130));
    wallRun = await loadSpriteAnimation('wall.png', frameData);

    wall = wallComponent()
      ..animation = wallRun
      ..anchor = flame_components.Anchor.center
      ..position = size / 2
      ..size = Vector2(81, 200);
    add(wall);
  }
}

// ignore: camel_case_types, must_be_immutable
class wallComponent extends flame_components.SpriteAnimationComponent
    with flame_components.Draggable {
  Vector2? dragDeltaPosition;

  @override
  void update(double dt) {
    super.update(dt);
    debugColor = isDragged && parent is DragDemoGame
        ? Colors.greenAccent
        : Colors.purple;
  }

  @override
  bool onDragStart(DragStartInfo info) {
    dragDeltaPosition = info.eventPosition.game - position;
    return false;
  }

  @override
  bool onDragUpdate(DragUpdateInfo info) {
    if (parent is! DragDemoGame) {
      return true;
    }
    final dragDeltaPosition = this.dragDeltaPosition;
    if (dragDeltaPosition == null) {
      return false;
    }

    position.setFrom(info.eventPosition.game - dragDeltaPosition);
    return false;
  }

  @override
  bool onDragEnd(DragEndInfo _) {
    dragDeltaPosition = null;
    return false;
  }

  @override
  bool onDragCancel() {
    dragDeltaPosition = null;
    return false;
  }
}
