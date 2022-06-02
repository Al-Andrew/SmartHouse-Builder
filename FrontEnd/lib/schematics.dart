import 'package:flutter/material.dart';
import 'package:homepage/builder.dart';
import 'package:homepage/models/schematic.dart';
import 'package:homepage/schematics_item.dart';
import 'package:homepage/dummy_schematics.dart';

class AllSchematics extends StatefulWidget {
  final List<Schematic> _allSchematics;
  AllSchematics(this._allSchematics);

  @override
  State<AllSchematics> createState() => _AllSchematicsState();
}

class _AllSchematicsState extends State<AllSchematics> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //shrinkWrap: true,
      //physics: AlwaysScrollableScrollPhysics(),
      children: widget._allSchematics
          .map((schData) => SchematicItem(
              schData.id, schData.title, schData.linkImg, schData.addFn))
          .toList(),
    );
  }
}
