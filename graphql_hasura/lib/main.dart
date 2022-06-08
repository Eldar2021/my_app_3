import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'app/app.dart';

void main() {
  Hive.init('database');
  runApp(const MyApp());
}
