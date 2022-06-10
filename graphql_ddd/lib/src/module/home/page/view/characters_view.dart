import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../src.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  final _pagingController = PagingController<int, Character>(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
    super.initState();
  }

  Future<void> _fetchPage(int p) async {
    try {
      final newItems = await context.read<HomeCubit>().getCharactersInPage(p);
      final isLastPage = newItems.length < 20;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        _pagingController.appendPage(newItems, p + 1);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CharactersView'),
      ),
      body: PagedListView<int, Character>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Character>(
          itemBuilder: (context, item, index) => Card(
            child: ListTile(
              leading: Text(item.id),
              title: Text(item.name),
            ),
          ),
        ),
      ),
    );
  }
}
