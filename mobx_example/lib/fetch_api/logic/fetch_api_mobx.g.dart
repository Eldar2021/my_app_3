// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_api_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HackerNewsMobx on _HackerNewsMobx, Store {
  late final _$_newsItemsFutureAtom =
      Atom(name: '_HackerNewsMobx._newsItemsFuture', context: context);

  @override
  ObservableFuture<List<FeedItem>>? get _newsItemsFuture {
    _$_newsItemsFutureAtom.reportRead();
    return super._newsItemsFuture;
  }

  @override
  set _newsItemsFuture(ObservableFuture<List<FeedItem>>? value) {
    _$_newsItemsFutureAtom.reportWrite(value, super._newsItemsFuture, () {
      super._newsItemsFuture = value;
    });
  }

  late final _$_topItemsFutureAtom =
      Atom(name: '_HackerNewsMobx._topItemsFuture', context: context);

  @override
  ObservableFuture<List<FeedItem>>? get _topItemsFuture {
    _$_topItemsFutureAtom.reportRead();
    return super._topItemsFuture;
  }

  @override
  set _topItemsFuture(ObservableFuture<List<FeedItem>>? value) {
    _$_topItemsFutureAtom.reportWrite(value, super._topItemsFuture, () {
      super._topItemsFuture = value;
    });
  }

  late final _$_HackerNewsMobxActionController =
      ActionController(name: '_HackerNewsMobx', context: context);

  @override
  Future<dynamic> fetchNewsItems() {
    final _$actionInfo = _$_HackerNewsMobxActionController.startAction(
        name: '_HackerNewsMobx.fetchNewsItems');
    try {
      return super.fetchNewsItems();
    } finally {
      _$_HackerNewsMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchTopItems() {
    final _$actionInfo = _$_HackerNewsMobxActionController.startAction(
        name: '_HackerNewsMobx.fetchTopItems');
    try {
      return super.fetchTopItems();
    } finally {
      _$_HackerNewsMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
