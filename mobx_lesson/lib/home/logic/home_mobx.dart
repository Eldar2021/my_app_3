import 'package:mobx/mobx.dart';
import 'package:mobx_lesson/home/data/home_data.dart';
import 'package:mobx_lesson/home/data/home_repo.dart';

part 'home_mobx.g.dart';

enum FetchStatus { initial, loading, success, error }

// ignore: library_private_types_in_public_api
class HomeMobx = _HomeMobxBase with _$HomeMobx;

abstract class _HomeMobxBase with Store {
  _HomeMobxBase(this.repo);
  final HomeRepo repo;

  @observable
  FetchStatus status = FetchStatus.initial;

  @observable
  List<Home> items = [];

  @action
  Future<void> getItems() async {
    status = FetchStatus.loading;
    final res = await repo.getItems();

    res.fold(
      (l) => status = FetchStatus.error,
      (r) {
        status = FetchStatus.success;
        items = r;
      },
    );
  }
}
