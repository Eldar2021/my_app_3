import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart';
import 'package:http_service1/http_service1.dart';
import 'package:mobx_lesson/home/data/home_repo.dart';
import 'package:mobx_lesson/home/logic/home_mobx.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final homeMobx = HomeMobx(HomeRepo(
    HttpService(Client(), 'https://jsonplaceholder.typicode.com/posts'),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
      ),
      body: Observer(
        builder: (_) {
          if (homeMobx.status == FetchStatus.initial) {
            return const Center(child: Text('initial'));
          } else if (homeMobx.status == FetchStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (homeMobx.status == FetchStatus.success) {
            return ListView.builder(
              itemCount: homeMobx.items.length,
              itemBuilder: (context, index) {
                final item = homeMobx.items[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.body),
                );
              },
            );
          } else {
            return const Center(child: Text('error'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: homeMobx.getItems,
      ),
    );
  }
}
