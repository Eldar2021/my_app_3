import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_3_custom/theme/theme_cubit.dart';

import 'app/app.dart';

void main() {
  runApp(BlocProvider(
    create: (ctx) => ThemeCubit(),
    child: const MyApp(),
  ));
}
