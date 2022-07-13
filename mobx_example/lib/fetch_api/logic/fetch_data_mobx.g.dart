// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_data_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FetchDataMobx on _FetchDataMobx, Store {
  late final _$typeAtom = Atom(name: '_FetchDataMobx.type', context: context);

  @override
  FetctType get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(FetctType value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$todosAtom = Atom(name: '_FetchDataMobx.todos', context: context);

  @override
  ObservableFuture<List<Todo>?>? get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableFuture<List<Todo>?>? value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$fetchDataAsyncAction =
      AsyncAction('_FetchDataMobx.fetchData', context: context);

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  @override
  String toString() {
    return '''
type: ${type},
todos: ${todos}
    ''';
  }
}
