import 'package:mobx/mobx.dart';
import 'package:mobx_example/fetch_api/data/hn_api.dart';
import 'package:mobx_example/fetch_api/data/service.dart';

part 'fetch_api_mobx.g.dart';

enum FeedType { latest, top }

// ignore: library_private_types_in_public_api
class HackerNewsMobx = _HackerNewsMobx with _$HackerNewsMobx;

abstract class _HackerNewsMobx with Store {
  final _hnApi = HNApi();

  @observable
  ObservableFuture<List<FeedItem>>? _newsItemsFuture;

  @observable
  ObservableFuture<List<FeedItem>>? _topItemsFuture;

  @action
  Future fetchNewsItems() => ObservableFuture(_hnApi.newest());

  @action
  Future fetchTopItems() => ObservableFuture(_hnApi.top());

  void loadNews(FeedType type) {
    if (type == FeedType.latest && _newsItemsFuture == null) fetchNewsItems();
    if (type == FeedType.top && _topItemsFuture == null) fetchTopItems();
  }

  // Future<void> openUrl(String url) async {
  //   final uri = Uri.parse(url);
  // }
}
