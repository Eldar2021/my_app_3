import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/src/core/core.dart';

import '../logic/users_cubit.dart';
import 'users_screen.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UsersCubit>(),
      child: const UsersScreen(),
    );
  }
}
