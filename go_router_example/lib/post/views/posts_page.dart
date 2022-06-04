import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const posts = [
  'Turat',
  'Eldiyar',
  'Jasur',
  'Azat',
  'Janara',
  'Aidayim',
  'Nadirber',
  'Kerim',
];

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PostsScreen'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (contex, index) {
          return Card(
            child: ListTile(
              title: Text(posts[index]),
              onTap: () => contex.push(
                '/posts/${posts[index]}',
                extra: {'post': posts[index]},
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
      ),
    );
  }
}
