// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:homepage/global_variables.dart' as gv;
import 'package:http/http.dart' as http;
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart' hide Draggable;
import 'package:flutter/services.dart';

const String baseUri = "http://localhost:8070";

Future<Setup> createSetupRequest(int userId, String name) async {
  final resp = await http
      .post(Uri.parse(baseUri + "/api/shb/setup?userId=$userId&name=$name"));

  return Setup.fromJson(jsonDecode(resp.body));
}

Future<List<Setup>> getSetupsForUserRequest(int userId) async {
  final resp = await http.get(Uri.parse(baseUri + "/api/shb/setup/$userId"));

  List<dynamic> setups = jsonDecode(resp.body);
  List<Setup> ret =
      setups.map((e) => Setup.fromJson(e as Map<String, dynamic>)).toList();

  return ret;
}

Future updateSetupComponentsRequest() async {
  int id = BuilderState.setup.id;
  String j = jsonEncode(BuilderState.setup.toJson());
  print(j);

  final resp = await http
      .post(Uri.parse(baseUri + "/api/shb/setup/updateComponents?id=$id"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'text/plain'
          },
          body: j)
      .then((value) => print("Updated setup components"),
          onError: (err) => print(err));

  return resp;
}

class Setup {
  var id;
  List<BaseSchematic> components = [];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'components': components.map((e) => e.toJson()).toList()
    };
  }

  static Setup fromJson(Map<String, dynamic> json) {
    var ret = Setup();
    ret.id = json['id'];
    List<dynamic> cmpDyn = jsonDecode(json['components'])['components'];
    List<Map<String, dynamic>> cmp =
        cmpDyn.map((e) => e as Map<String, dynamic>).toList();

    for (var c in cmp) {
      BaseSchematic schm = BaseSchematic.fromJson(c);
      ret.components.add(schm);
    }

    return ret;
  }
}

class BuilderCon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BuilderState();
  }
}

class BuilderState extends State<BuilderCon> {
  static var flameContext = Builder();
  static Setup setup = Setup();

  static void createEmptySetup() {
    Future<Setup> r = createSetupRequest(gv.userID, 'unnamed setup');
    r.then((value) => BuilderState.replaceSetup(value),
        onError: (err) => print(err));
  }

  static void replaceSetup(Setup newSetup) {
    for (var child in flameContext.children) {
      flameContext.remove(child);
    }

    BuilderState.setup = newSetup;

    for (var schm in BuilderState.setup.components) {
      switch (schm.runtimeType) {
        case Wall:
          AddNewWall(schm as Wall);
          break;
        case Window:
          AddNewWindow(schm as Window);
          break;
        default:
          print("Unrecognized kinda schm");
      }
    }
  }

  static void AddNewWall(Wall? newWall) {
    if (newWall != null) {
      flameContext.add(newWall);
      return;
    }

    var lewall = Wall();
    flameContext.add(lewall);
    setup.components.add(lewall);
  }

  static void AddNewWindow(Window? schm) {
    if (schm != null) {
      flameContext.add(schm);
      return;
    }
    var win = Window();
    flameContext.add(win);
    setup.components.add(win);
  }

  @override
  void initState() {
    super.initState();
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
    List<Setup> userSetups = [];

    getSetupsForUserRequest(gv.userID).then((List<Setup> value) {
      userSetups = value;
    }, onError: (err) => print(err)).then((value) {
      if (userSetups.length == 0) {
        print("First time user");
        createSetupRequest(gv.userID, 'unnamed setup').then((value) {
          userSetups.add(value);
        }, onError: (err) => print(err));
      }
    }).then((value) {
      BuilderState.replaceSetup(userSetups.last);
    }, onError: (err) => print(err));

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
        BuilderState.setup.components.remove(c);
      }
    }
    final isSpace = keysPressed.contains(LogicalKeyboardKey.space);
    if (isSpace && isKeyDown) {
      BuilderState.AddNewWall(null);
      return KeyEventResult.handled;
    }
    final isB = keysPressed.contains(LogicalKeyboardKey.keyB);
    if (isB && isKeyDown) {
      print(jsonEncode(BuilderState.setup.toJson()));
      return KeyEventResult.handled;
    }
    final isL = keysPressed.contains(LogicalKeyboardKey.keyL);
    if (isL && isKeyDown) {
      print(jsonEncode(BuilderState.setup.toJson()));
      updateSetupComponentsRequest();
      return KeyEventResult.handled;
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

abstract class BaseSchematic extends PositionComponent with Tappable {
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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'type': getType(),
      'size': vecToJson(size),
      'transform': _transformToJson(transform),
      'anchor': vecToJson(anchor.toVector2())
    };
  }

  static BaseSchematic fromJson(Map<String, dynamic> json) {
    BaseSchematic? component;
    switch (json['type']) {
      case "Wall":
        {
          component = Wall();
          break;
        }
      case "Window":
        {
          component = Window();
          break;
        }
      default:
    }
    component!.size.setFrom(vecFromJson(json['size']));
    component.transform.setFrom(transformFromJson(json['transform']));
    final anchorvec = vecFromJson(json['anchor']);
    component.anchor = Anchor(anchorvec.x, anchorvec.y);

    return component;
  }

  @override
  void render(Canvas canvas);

  String getType();
}

Map<String, dynamic> _transformToJson(Transform2D t) {
  return <String, dynamic>{
    'position': vecToJson(t.position),
    'scale': vecToJson(t.scale),
    'angle': t.angle,
    'offset': vecToJson(t.offset)
  };
}

Transform2D transformFromJson(Map<String, dynamic> json) {
  Transform2D ret = Transform2D();
  ret.position.setFrom(vecFromJson(json['position']));
  ret.scale.setFrom(vecFromJson(json['scale']));
  ret.angle = json['angle'];
  ret.offset.setFrom(vecFromJson(json['offset']));
  return ret;
}

Map<String, dynamic> vecToJson(Vector2 vec) {
  return <String, dynamic>{'x': vec.x, 'y': vec.y};
}

Vector2 vecFromJson(Map<String, dynamic> json) {
  return Vector2(json['x'], json['y']);
}

class Window extends BaseSchematic {
  Window() : super(Vector2(100, 100));

  @override
  String getType() {
    return "Window";
  }

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
  String getType() {
    return "Wall";
  }

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

class Door extends BaseSchematic {
  Door() : super(Vector2(100, 100));

  @override
  String getType() {
    return "Door";
  }

  @override
  void render(Canvas canvas) {
    Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.color = Colors.black;
    paint.strokeWidth = 6;

    final arc1 = Path();
    arc1.moveTo(0, 0.95 * size.y);
    arc1.arcToPoint(
      Offset(size.x, 0),
      radius: Radius.circular(100),
    );

    canvas.drawLine(Offset(size.x, size.y), Offset(size.x, 0), paint);
    canvas.drawPath(arc1, paint);
  }
}

class SmartObject extends BaseSchematic {
  SmartObject() : super(Vector2(100, 200));

  @override
  String getType() {
    return "SmartObject";
  }

  @override
  void render(Canvas canvas) {
    Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.color = Colors.black;
    paint.strokeWidth = 2;

    Rect myRect = Offset(0.4 * size.x, 0) & Size(0.2 * size.x, size.y);
    canvas.drawRect(myRect, paint);
    canvas.drawLine(
        Offset(0.4 * size.x, size.y), Offset(0.6 * size.x, 0), paint);
    canvas.drawLine(
        Offset(0.6 * size.x, size.y), Offset(0.4 * size.x, 0), paint);
  }
}
