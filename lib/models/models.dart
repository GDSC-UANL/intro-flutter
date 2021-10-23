import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final contactColors = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.indigo
];

class Contact{
  String id = UniqueKey().toString();
  MaterialColor color = contactColors[Random().nextInt(contactColors.length)];
  String name = "";
  String lastname = "";
  String phonenumber = "";
  String email = "";
}