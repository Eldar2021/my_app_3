import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/app/router/is_true_router.dart';
import 'package:go_router_example/auth/auth.dart';
import 'package:go_router_example/counter/counter.dart';
import 'package:go_router_example/l10n/l10n.dart';
import 'package:go_router_example/post/views/posts_page.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CounterText(),
            const CounterEleveted(),
            ElevatedButton(
              onPressed: () => context.go('/posts'),
              child: const Text('posts'),
            ),
            ElevatedButton(
              onPressed: () => context.goNamed(IsTRoute.I.posts),
              child: const Text('posts Named'),
            ),
            ElevatedButton(
              onPressed: () => context.go(
                '/posts/${posts[0]}',
                extra: {'post': posts[0]},
              ),
              child: const Text('post1'),
            ),
            ElevatedButton(
              onPressed: () => context.goNamed(
                IsTRoute.I.post,
                params: {'post': posts[0]},
                extra: {'post': posts[0]},
              ),
              child: const Text('post1 Named'),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () => context.read<CounterCubit>().increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class CounterEleveted extends StatelessWidget {
  const CounterEleveted({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ElevatedButton(
            onPressed: () {
              context.read<AuthCubit>().signout();
            },
            child: const Text('Sing Out'),
          );
        }
      },
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.headline1);
  }
}
