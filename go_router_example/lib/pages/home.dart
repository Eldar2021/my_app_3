import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/app/cubit/auth_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('HomeScreen'),
            ElevatedButton(
              onPressed: () => context.go('/home1'),
              child: const Text('home1'),
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listenWhen: (previous, current) => current is AuthEmpty,
              listener: (context, state) => context.go('/login'),
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const CircularProgressIndicator();
                } else if (state is AuthError) {
                  return Text(state.exception.toString());
                } else {
                  return ElevatedButton(
                    onPressed: () => context.read<AuthCubit>().signout(),
                    child: const Text('signOut'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
