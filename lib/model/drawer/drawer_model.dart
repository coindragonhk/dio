import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class DrawerModel {
  DrawerModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  final String id;
  final String name;
  final Icon icon;
}
