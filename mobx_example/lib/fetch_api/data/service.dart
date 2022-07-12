import 'dart:convert';

import 'package:http/http.dart' as http;

import 'hn_api.dart';

class HNApi {
  Future<List<FeedItem>> newest() async {
    final intItems = await _getItems(Type.newest);

    final feedItems = await Future.wait(intItems.map(_getItem));

    return feedItems.toList(growable: false);
  }

  Future<List<FeedItem>> top() async {
    final intItems = await _getItems(Type.top);

    final feedItems = await Future.wait(intItems.map(_getItem));

    return feedItems.toList(growable: false);
  }

  Future<List<int>> _getItems(Type type, {int count = 25}) async {
    final res = await http.get(type.url);

    final items =
        (jsonDecode(res.body) as List).take(count).map((e) => e as int).toList(growable: false);

    return items;
  }

  Future<FeedItem> _getItem(int id) async {
    final res = await http.get(
      Uri.parse('https://hacker-news.firebaseio.com/v0/item/$id.json'),
    );

    final json = jsonDecode(res.body) as Map<String, dynamic>;

    return FeedItem.fromJson(json);
  }
}
