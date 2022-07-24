import 'package:mobx/mobx.dart';

part 'counter_mobx.g.dart';

// flutter packages pub run build_runner build

// Store => Mobx tin mixini code genratsiany ushuga karap kylat
// Observer => obserable datany ugup aga karata widget chiyet

// @obserable => mabx tin ichindegi ozgorulo turgan datany ataybiz
// @action => obserable bolgon datany ozgortkondo listener bolot
// @computed => obserable bolgon datany ugup aga karata ozun ozgortup turat
// @reaction => ?

// ignore: library_private_types_in_public_api
class CounterMobx = _CounterMobxBase with _$CounterMobx;

abstract class _CounterMobxBase with Store {
  @observable
  int count = 0;

  @computed
  bool get isPositive => count > 0;

  @action
  void increment() => count++;

  @action
  void decrement() => count--;
}
