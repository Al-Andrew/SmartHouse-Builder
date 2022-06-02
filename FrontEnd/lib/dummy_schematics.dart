import 'package:flutter/material.dart';
import 'package:homepage/builder.dart';
import './models/schematic.dart';

var DUMMY_SCHEMATICS = [
  Schematic(
    id: '0',
    title: 'Wall',
    linkImg: 'https://i.imgur.com/rqpEfFa.png',
    addFn: () {
      BuilderState.AddNewWall(null);
    },
  ),
  Schematic(
    id: '1',
    title: 'Door',
    linkImg: 'https://i.imgur.com/eCPy7jI.png',
    addFn: () {
      BuilderState.AddNewDoor(null);
    },
  ),
  Schematic(
    id: '2',
    title: 'Window',
    linkImg: 'https://i.imgur.com/tKWeNek.png',
    addFn: () {
      BuilderState.AddNewWindow(null);
    },
  ),
];
