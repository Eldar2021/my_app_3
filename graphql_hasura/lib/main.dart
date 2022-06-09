import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.init('database');
  runApp(const MyApp());
}
