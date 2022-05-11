import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart' hide Draggable;
import 'package:flame/input.dart';

void main() {
  var game = DragDemoGame();
  runApp(
    MaterialApp(
      home: Stack(children: [GameWidget(game: game), ButtonScreen(game: game)]),
    ),
  );
}

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({Key? key, required this.game}) : super(key: key);

  final DragDemoGame game;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  game.wall.x -= 40;
                },
                child: const Text('Flutter Button L')),
            ElevatedButton(
                onPressed: () {
                  game.wall.x += 40;
                },
                child: const Text('Flutter Button R')),
          ],
        )
      ],
    );
  }
}

class DragDemoGame extends FlameGame with HasDraggables {
  late SpriteAnimation wallRun;
  late wallComponent wall;

  // DragDemoGame({required this.zoom});
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    SpriteAnimationData frameData = SpriteAnimationData.sequenced(
        amount: 10, stepTime: .05, textureSize: Vector2(94, 130));
    wallRun = await loadSpriteAnimation('wall.png', frameData);

    wall = wallComponent()
      ..animation = wallRun
      ..anchor = Anchor.center
      ..position = size / 2
      ..size = Vector2(81, 200);
    add(wall);
  }
}

class wallComponent extends SpriteAnimationComponent with Draggable {
  Vector2? dragDeltaPosition;

  @override
  void update(double dt) {
    super.update(dt);
    debugColor = isDragged && parent is DragDemoGame
        ? Colors.greenAccent
        : Colors.purple;
  }

  @override
  bool onDragStart(int pointerId, DragStartInfo info) {
    dragDeltaPosition = info.eventPosition.game - position;
    return false;
  }

  @override
  bool onDragUpdate(int pointerId, DragUpdateInfo info) {
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
  bool onDragEnd(int pointerId, DragEndInfo _) {
    dragDeltaPosition = null;
    return false;
  }

  @override
  bool onDragCancel(int pointerId) {
    dragDeltaPosition = null;
    return false;
  }
}
