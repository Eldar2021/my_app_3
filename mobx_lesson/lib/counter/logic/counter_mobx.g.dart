// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CounterMobx on _CounterMobxBase, Store {
  Computed<bool>? _$isPositiveComputed;

  @override
  bool get isPositive =>
      (_$isPositiveComputed ??= Computed<bool>(() => super.isPositive,
              name: '_CounterMobxBase.isPositive'))
          .value;

  late final _$countAtom =
      Atom(name: '_CounterMobxBase.count', context: context);

  @override
  int get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  late final _$_CounterMobxBaseActionController =
      ActionController(name: '_CounterMobxBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_CounterMobxBaseActionController.startAction(
        name: '_CounterMobxBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CounterMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_CounterMobxBaseActionController.startAction(
        name: '_CounterMobxBase.decrement');
    try {
      return super.decrement();
    } finally {
      _$_CounterMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
count: ${count},
isPositive: ${isPositive}
    ''';
  }
}
