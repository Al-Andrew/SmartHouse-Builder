import 'package:flutter/material.dart';
import 'package:homepage/builder.dart';
import './models/schematic.dart';
import 'models/setup.dart';

List<UserSetup> DUMMY_SETUPS = [
  UserSetup(
    id: '0',
    nume: 'Setup 1',
    // linkImg: 'assets/schematics/wall.png',
    addFn: () {},
  ),
  UserSetup(
    id: '1',
    nume: 'Setup 2',
    // linkImg: 'assets/schematics/door.png',
    addFn: () {},
  ),
  UserSetup(
    id: '2',
    nume: 'Setup 3',
    // linkImg: 'assets/schematics/window.png',
    addFn: () {},
  ),
];
