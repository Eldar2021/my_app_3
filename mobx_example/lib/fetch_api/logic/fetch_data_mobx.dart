import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../data/data.dart';

part 'fetch_data_mobx.g.dart';

enum FetctType { loading, success, error }

// ignore: library_private_types_in_public_api
class FetchDataMobx = _FetchDataMobx with _$FetchDataMobx;

abstract class _FetchDataMobx with Store {
  _FetchDataMobx(this._repo);

  final TodoRepo _repo;

  @observable
  FetctType type = FetctType.loading;

  @observable
  ObservableFuture<List<Todo>?>? todos;

  @action
  Future<void> fetchData() async {
    try {
      // await Future.delayed(const Duration(second s: 10));
      type = FetctType.loading;
      // await Future.delayed(const Duration(seconds: 12));
      todos = ObservableFuture(_repo.fetchData()).whenComplete(() => type = FetctType.success);
      // await Future.delayed(const Duration(seconds: 2));
      // type = FetctType.success;
    } catch (e) {
      log(e.toString());
      type = FetctType.error;
    }
  }
}
