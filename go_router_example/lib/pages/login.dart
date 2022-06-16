import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_example/app/cubit/auth_cubit.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
      ),
      body: Center(
        child: BlocConsumer<AuthCubit, AuthState>(
          listenWhen: (previous, current) => current is AuthSuccess,
          listener: (context, state) => context.go('/'),
          builder: (context, state) {
            if (state is AuthLoading) {
              return const CircularProgressIndicator();
            } else if (state is AuthError) {
              return Text(state.exception.toString());
            } else {
              return ElevatedButton(
                onPressed: () => context.read<AuthCubit>().signin(),
                child: const Text('signIn'),
              );
            }
          },
        ),
      ),
    );
  }
}
