import 'package:mobx/mobx.dart';
part 'counter_mobx.g.dart';

// flutter packages pub run build_runner build

// ignore: library_private_types_in_public_api
class CounterMobx = _CounterMobxBase with _$CounterMobx;

abstract class _CounterMobxBase with Store {
  @observable
  int count = 0;

  @action
  void increment() => count++;

  @action
  void decrement() => count--;

  @computed
  bool get isPositive => count > 0;
}
