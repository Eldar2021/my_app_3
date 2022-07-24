// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeMobx on _HomeMobxBase, Store {
  late final _$statusAtom =
      Atom(name: '_HomeMobxBase.status', context: context);

  @override
  FetchStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(FetchStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$itemsAtom = Atom(name: '_HomeMobxBase.items', context: context);

  @override
  List<Home> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<Home> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$getItemsAsyncAction =
      AsyncAction('_HomeMobxBase.getItems', context: context);

  @override
  Future<void> getItems() {
    return _$getItemsAsyncAction.run(() => super.getItems());
  }

  @override
  String toString() {
    return '''
status: ${status},
items: ${items}
    ''';
  }
}
