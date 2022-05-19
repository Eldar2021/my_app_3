import 'package:file_download/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // setup();
  runApp(BlocProvider(
    create: (context) => ThemeCubit(),
    child: const MyApp(),
  ));
}