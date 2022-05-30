import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'theme/theme_cubit.dart';

void main() {
  runApp(BlocProvider(
    create: (ctx) => ThemeCubit(),
    child: const MyApp(),
  ));
}
