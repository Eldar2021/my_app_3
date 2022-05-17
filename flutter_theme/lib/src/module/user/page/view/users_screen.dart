import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../src.dart';
import '../widget/users.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UsersScreen'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeCubit>().changeWithIcon(
                    context.theme.brightness == Brightness.light ? false : true,
                  );
            },
            icon: const Icon(Icons.light_mode_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              UsersContainer(height: context.width * 0.7),
              const UsersList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _change(context),
        child: const Icon(Icons.account_tree_rounded),
      ),
    );
  }

  void _change(BuildContext _) {
    showDialog(
      context: _,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert!!"),
          content: BlocProvider.value(
            value: _.read<ThemeCubit>(),
            child: const AlertTheme(),
          ),
        );
      },
    );
  }
}

class UsersContainer extends Container {
  UsersContainer({super.key, double? height})
      : super(height: height, margin: const EdgeInsets.all(10));

  final String image = 'https://picsum.photos/200/300';

  @override
  Decoration? get decoration => BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      );
}
