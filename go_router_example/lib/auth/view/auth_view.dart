import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/auth/auth.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Sugn In'),
            BlocConsumer<AuthCubit, AuthState>(
              listenWhen: (oldState, state) => state == AuthSingin(),
              listener: (context, state) => context.go('/counter'),
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<AuthCubit>().signin();
                    },
                    child: const Text('Sing In'),
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
