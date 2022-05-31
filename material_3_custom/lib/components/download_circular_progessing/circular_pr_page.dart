import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'circular_progressing.dart';
import 'circular_progressing_cubit.dart';

class CircularPrPage extends StatelessWidget {
  const CircularPrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CircularPrPage')),
      body: Center(
        child: BlocProvider(
          create: (context) => CircularPrCubit(),
          child: const CircularPrWidget(),
        ),
      ),
    );
  }
}

class CircularPrWidget extends StatelessWidget {
  const CircularPrWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CircularPrCubit, CircularPrState>(
      builder: (context, state) {
        if (state is CircularPrInit) {
          return IconButton(
            onPressed: () {
              context.read<CircularPrCubit>().downLoad();
            },
            icon: const Icon(Icons.download),
          );
        } else if (state is CircularPrPg) {
          return LoadingCircular(state.val, height: 60, width: 60);
        } else {
          return const Icon(Icons.check);
        }
      },
    );
  }
}
