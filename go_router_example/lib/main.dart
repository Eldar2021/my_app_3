import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_example/app/cubit/auth_cubit.dart';

import 'app/app.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => AuthCubit(),
    child: const MyApp(),
  ));
}
