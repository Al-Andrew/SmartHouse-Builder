import 'package:flutter/material.dart';
import 'package:homepage/builder.dart';
import 'package:homepage/models/schematic.dart';
import 'package:homepage/schematics_item.dart';
import 'package:homepage/dummy_schematics.dart';
import 'package:homepage/setup_item.dart';

import 'models/setup.dart';

class AllSetups extends StatefulWidget {
  final List<UserSetup> _allSetups;
  AllSetups(this._allSetups);

  @override
  State<AllSetups> createState() => _AllSetupsState();
}

class _AllSetupsState extends State<AllSetups> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      children: widget._allSetups
          .map((schData) => SetupItem(schData.id, schData.nume, schData.addFn))
          .toList(),
    );
  }
}
