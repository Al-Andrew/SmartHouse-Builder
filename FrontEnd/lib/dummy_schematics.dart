import 'package:flutter/material.dart';
import 'package:homepage/builder.dart';
import './models/schematic.dart';

var DUMMY_SCHEMATICS = [
  Schematic(
    id: '0',
    title: 'Wall',
    linkImg: 'assets/schematics/wall.png',
    addFn: () {
      BuilderState.AddNewWall(null);
    },
  ),
  Schematic(
    id: '1',
    title: 'Door',
    linkImg: 'assets/schematics/door.png',
    addFn: () {
      BuilderState.AddNewWall(null);
    },
  ),
  Schematic(
    id: '2',
    title: 'Window',
    linkImg: 'assets/schematics/window.png',
    addFn: () {
      BuilderState.AddNewWall(null);
    },
  ),
];
